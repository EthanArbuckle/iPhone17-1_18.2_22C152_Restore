@interface GEOBusiness
+ (BOOL)isValid:(id)a3;
+ (Class)attributeKeyValueType;
+ (Class)attributionType;
+ (Class)categoryType;
+ (Class)localizedCategoriesType;
+ (Class)openHoursType;
+ (Class)photoType;
+ (Class)placeDataAmendmentType;
+ (Class)ratingType;
+ (Class)sourceType;
+ (Class)starRatingType;
- (BOOL)hasCenter;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsClosed;
- (BOOL)hasMapsURL;
- (BOOL)hasName;
- (BOOL)hasPhoneticName;
- (BOOL)hasTelephone;
- (BOOL)hasUID;
- (BOOL)hasURL;
- (BOOL)isClosed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOBusiness)init;
- (GEOBusiness)initWithBusinessURL:(id)a3 phoneNumber:(id)a4 muid:(unint64_t)a5 attributionID:(id)a6 sampleSizeForUserRatingScore:(unsigned int)a7 normalizedUserRatingScore:(float)a8;
- (GEOBusiness)initWithData:(id)a3;
- (GEOBusiness)initWithDictionary:(id)a3;
- (GEOBusiness)initWithJSON:(id)a3;
- (GEOBusiness)initWithPlaceDataEntity:(id)a3 rating:(id)a4 hours:(id)a5 reviews:(id)a6 photos:(id)a7 entityAttribution:(id)a8;
- (GEOLatLng)center;
- (NSMutableArray)attributeKeyValues;
- (NSMutableArray)attributions;
- (NSMutableArray)categorys;
- (NSMutableArray)localizedCategories;
- (NSMutableArray)openHours;
- (NSMutableArray)photos;
- (NSMutableArray)placeDataAmendments;
- (NSMutableArray)ratings;
- (NSMutableArray)sources;
- (NSMutableArray)starRatings;
- (NSString)mapsURL;
- (NSString)name;
- (NSString)phoneticName;
- (NSString)telephone;
- (NSString)uRL;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)attributeKeyValueAtIndex:(unint64_t)a3;
- (id)attributionAtIndex:(unint64_t)a3;
- (id)categoryAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)localizedCategoriesAtIndex:(unint64_t)a3;
- (id)openHoursAtIndex:(unint64_t)a3;
- (id)photoAtIndex:(unint64_t)a3;
- (id)placeDataAmendmentAtIndex:(unint64_t)a3;
- (id)ratingAtIndex:(unint64_t)a3;
- (id)sourceAtIndex:(unint64_t)a3;
- (id)starRatingAtIndex:(unint64_t)a3;
- (unint64_t)attributeKeyValuesCount;
- (unint64_t)attributionsCount;
- (unint64_t)categorysCount;
- (unint64_t)hash;
- (unint64_t)localizedCategoriesCount;
- (unint64_t)openHoursCount;
- (unint64_t)photosCount;
- (unint64_t)placeDataAmendmentsCount;
- (unint64_t)ratingsCount;
- (unint64_t)sourcesCount;
- (unint64_t)starRatingsCount;
- (unint64_t)uID;
- (void)_addNoFlagsAttributeKeyValue:(uint64_t)a1;
- (void)_addNoFlagsAttribution:(uint64_t)a1;
- (void)_addNoFlagsCategory:(uint64_t)a1;
- (void)_addNoFlagsLocalizedCategories:(uint64_t)a1;
- (void)_addNoFlagsOpenHours:(uint64_t)a1;
- (void)_addNoFlagsPhoto:(uint64_t)a1;
- (void)_addNoFlagsPlaceDataAmendment:(uint64_t)a1;
- (void)_addNoFlagsRating:(uint64_t)a1;
- (void)_addNoFlagsSource:(uint64_t)a1;
- (void)_addNoFlagsStarRating:(uint64_t)a1;
- (void)_readAttributeKeyValues;
- (void)_readAttributions;
- (void)_readCategorys;
- (void)_readCenter;
- (void)_readLocalizedCategories;
- (void)_readMapsURL;
- (void)_readName;
- (void)_readOpenHours;
- (void)_readPhoneticName;
- (void)_readPhotos;
- (void)_readPlaceDataAmendments;
- (void)_readRatings;
- (void)_readSources;
- (void)_readStarRatings;
- (void)_readTelephone;
- (void)_readURL;
- (void)addAttributeKeyValue:(id)a3;
- (void)addAttribution:(id)a3;
- (void)addCategory:(id)a3;
- (void)addLocalizedCategories:(id)a3;
- (void)addOpenHours:(id)a3;
- (void)addPhoto:(id)a3;
- (void)addPlaceDataAmendment:(id)a3;
- (void)addRating:(id)a3;
- (void)addSource:(id)a3;
- (void)addStarRating:(id)a3;
- (void)clearAttributeKeyValues;
- (void)clearAttributions;
- (void)clearCategorys;
- (void)clearLocalizedCategories;
- (void)clearOpenHours;
- (void)clearPhotos;
- (void)clearPlaceDataAmendments;
- (void)clearRatings;
- (void)clearSources;
- (void)clearStarRatings;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAttributeKeyValues:(id)a3;
- (void)setAttributions:(id)a3;
- (void)setCategorys:(id)a3;
- (void)setCenter:(id)a3;
- (void)setHasIsClosed:(BOOL)a3;
- (void)setHasUID:(BOOL)a3;
- (void)setIsClosed:(BOOL)a3;
- (void)setLocalizedCategories:(id)a3;
- (void)setMapsURL:(id)a3;
- (void)setName:(id)a3;
- (void)setOpenHours:(id)a3;
- (void)setPhoneticName:(id)a3;
- (void)setPhotos:(id)a3;
- (void)setPlaceDataAmendments:(id)a3;
- (void)setRatings:(id)a3;
- (void)setSources:(id)a3;
- (void)setStarRatings:(id)a3;
- (void)setTelephone:(id)a3;
- (void)setUID:(unint64_t)a3;
- (void)setURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOBusiness

- (void)setName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80400u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 177) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_14);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (void)setUID:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x80001u;
  self->_uID = a3;
}

- (GEOBusiness)initWithPlaceDataEntity:(id)a3 rating:(id)a4 hours:(id)a5 reviews:(id)a6 photos:(id)a7 entityAttribution:(id)a8
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  v15 = (id *)a8;
  v59.receiver = self;
  v59.super_class = (Class)GEOBusiness;
  v16 = [(GEOBusiness *)&v59 init];
  if (v16)
  {
    if ([v12 hasTelephone])
    {
      v17 = [v12 telephone];
      [(GEOBusiness *)v16 setTelephone:v17];
    }
    if ([v12 hasUrl])
    {
      v18 = [v12 url];
      [(GEOBusiness *)v16 setURL:v18];
    }
    if ([v12 hasIsPermanentlyClosed]) {
      -[GEOBusiness setIsClosed:](v16, "setIsClosed:", [v12 isPermanentlyClosed]);
    }
    if (v15)
    {
      -[GEOPDAttribution _readExternalItemId]((uint64_t)v15);
      if (v15[6])
      {
        -[GEOPDAttribution _readVendorId]((uint64_t)v15);
        if (v15[7])
        {
          v19 = -[GEOPDAttribution vendorId](v15);
          v20 = [v19 componentsSeparatedByString:@"."];

          if ([v20 count] == 2)
          {
            v21 = [v20 lastObject];
            int v22 = [v21 isEqualToString:@"yelp"];

            if (v22)
            {
              v23 = objc_alloc_init(GEOSource);
              v24 = -[GEOPDAttribution externalItemId](v15);
              [(GEOSource *)v23 setSourceId:v24];

              v25 = [v20 lastObject];
              [(GEOSource *)v23 setSourceName:v25];

              [(GEOBusiness *)v16 addSource:v23];
            }
          }
        }
      }
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v46 = v13;
    id v26 = v13;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v62 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v56;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v56 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [[GEOHours alloc] initWithPlaceDataHours:*(void *)(*((void *)&v55 + 1) + 8 * v30)];
          [(GEOBusiness *)v16 addOpenHours:v31];

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v55 objects:v62 count:16];
      }
      while (v28);
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v32 = v14;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v52;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v52 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [[GEOPhoto alloc] initWithPlaceDataPhoto:*(void *)(*((void *)&v51 + 1) + 8 * v36)];
          [(GEOBusiness *)v16 addPhoto:v37];

          ++v36;
        }
        while (v34 != v36);
        uint64_t v34 = [v32 countByEnumeratingWithState:&v51 objects:v61 count:16];
      }
      while (v34);
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v38 = [v12 localizedCategorys];
    uint64_t v39 = [v38 countByEnumeratingWithState:&v47 objects:v60 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v48;
      do
      {
        uint64_t v42 = 0;
        do
        {
          if (*(void *)v48 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = [[GEOCategory alloc] initWithPlaceDataCategory:*(void *)(*((void *)&v47 + 1) + 8 * v42)];
          [(GEOBusiness *)v16 addLocalizedCategories:v43];

          ++v42;
        }
        while (v40 != v42);
        uint64_t v40 = [v38 countByEnumeratingWithState:&v47 objects:v60 count:16];
      }
      while (v40);
    }

    v44 = v16;
    id v13 = v46;
  }

  return v16;
}

- (void)addLocalizedCategories:(id)a3
{
  id v4 = a3;
  -[GEOBusiness _readLocalizedCategories]((uint64_t)self);
  -[GEOBusiness _addNoFlagsLocalizedCategories:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_readLocalizedCategories
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 177) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedCategories_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (void)_addNoFlagsLocalizedCategories:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)setTelephone:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC0000u;
  objc_storeStrong((id *)&self->_telephone, a3);
}

- (void)addPhoto:(id)a3
{
  id v4 = a3;
  -[GEOBusiness _readPhotos]((uint64_t)self);
  -[GEOBusiness _addNoFlagsPhoto:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_readPhotos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 177) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotos_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (void)_addNoFlagsPhoto:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 112);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v5;

      id v4 = *(void **)(a1 + 112);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addSource:(id)a3
{
  id v4 = a3;
  -[GEOBusiness _readSources]((uint64_t)self);
  -[GEOBusiness _addNoFlagsSource:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_readSources
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 178) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSources_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (void)_addNoFlagsSource:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 136);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = v5;

      id v4 = *(void **)(a1 + 136);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)setURL:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80008u;
  objc_storeStrong((id *)&self->_uRL, a3);
}

- (void)setIsClosed:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80002u;
  self->_isClosed = a3;
}

- (GEOBusiness)initWithBusinessURL:(id)a3 phoneNumber:(id)a4 muid:(unint64_t)a5 attributionID:(id)a6 sampleSizeForUserRatingScore:(unsigned int)a7 normalizedUserRatingScore:(float)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v25.receiver = self;
  v25.super_class = (Class)GEOBusiness;
  v17 = [(GEOBusiness *)&v25 init];
  if (v17)
  {
    if (v14)
    {
      v18 = [v14 absoluteString];
      [(GEOBusiness *)v17 setURL:v18];
    }
    if ([v15 length]) {
      [(GEOBusiness *)v17 setTelephone:v15];
    }
    if (a5) {
      [(GEOBusiness *)v17 setUID:a5];
    }
    if ([v16 length])
    {
      v19 = [[GEOSource alloc] initWithAttributionID:v16];
      if (v19) {
        [(GEOBusiness *)v17 addSource:v19];
      }
    }
    if (v9)
    {
      v20 = [GEORating alloc];
      *(float *)&double v21 = a8;
      int v22 = [(GEORating *)v20 initWithSampleSizeForUserRatingScore:v9 normalizedUserRatingScore:v21];
      if (v22) {
        [(GEOBusiness *)v17 addRating:v22];
      }
    }
    v23 = v17;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephone, 0);
  objc_storeStrong((id *)&self->_starRatings, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_ratings, 0);
  objc_storeStrong((id *)&self->_placeDataAmendments, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_phoneticName, 0);
  objc_storeStrong((id *)&self->_openHours, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapsURL, 0);
  objc_storeStrong((id *)&self->_localizedCategories, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_categorys, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_attributeKeyValues, 0);
  objc_storeStrong((id *)&self->_uRL, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOBusinessReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_80;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOBusiness *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 24) = self->_uID;
    *(_DWORD *)(v5 + 176) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  v10 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v9;

  uint64_t v11 = [(NSString *)self->_phoneticName copyWithZone:a3];
  id v12 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v11;

  uint64_t v13 = [(NSString *)self->_telephone copyWithZone:a3];
  id v14 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v13;

  uint64_t v15 = [(NSString *)self->_uRL copyWithZone:a3];
  id v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 172) = self->_isClosed;
    *(_DWORD *)(v5 + 176) |= 2u;
  }
  uint64_t v17 = [(NSString *)self->_mapsURL copyWithZone:a3];
  v18 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v17;

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  v19 = self->_ratings;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v109 objects:v122 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v110 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = (void *)[*(id *)(*((void *)&v109 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addRating:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v109 objects:v122 count:16];
    }
    while (v20);
  }

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  v24 = self->_categorys;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v105 objects:v121 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v106;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v106 != v26) {
          objc_enumerationMutation(v24);
        }
        uint64_t v28 = (void *)[*(id *)(*((void *)&v105 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addCategory:v28];
      }
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v105 objects:v121 count:16];
    }
    while (v25);
  }

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  uint64_t v29 = self->_photos;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v101 objects:v120 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v102;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v102 != v31) {
          objc_enumerationMutation(v29);
        }
        uint64_t v33 = (void *)[*(id *)(*((void *)&v101 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addPhoto:v33];
      }
      uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v101 objects:v120 count:16];
    }
    while (v30);
  }

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v34 = self->_attributeKeyValues;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v97 objects:v119 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v98;
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v98 != v36) {
          objc_enumerationMutation(v34);
        }
        v38 = (void *)[*(id *)(*((void *)&v97 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addAttributeKeyValue:v38];
      }
      uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v97 objects:v119 count:16];
    }
    while (v35);
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  uint64_t v39 = self->_openHours;
  uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v93 objects:v118 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v94;
    do
    {
      for (uint64_t n = 0; n != v40; ++n)
      {
        if (*(void *)v94 != v41) {
          objc_enumerationMutation(v39);
        }
        v43 = (void *)[*(id *)(*((void *)&v93 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addOpenHours:v43];
      }
      uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v93 objects:v118 count:16];
    }
    while (v40);
  }

  id v44 = [(GEOLatLng *)self->_center copyWithZone:a3];
  v45 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v44;

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v46 = self->_localizedCategories;
  uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v89 objects:v117 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v90;
    do
    {
      for (iuint64_t i = 0; ii != v47; ++ii)
      {
        if (*(void *)v90 != v48) {
          objc_enumerationMutation(v46);
        }
        long long v50 = (void *)[*(id *)(*((void *)&v89 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addLocalizedCategories:v50];
      }
      uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v89 objects:v117 count:16];
    }
    while (v47);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v51 = self->_attributions;
  uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v85 objects:v116 count:16];
  if (v52)
  {
    uint64_t v53 = *(void *)v86;
    do
    {
      for (juint64_t j = 0; jj != v52; ++jj)
      {
        if (*(void *)v86 != v53) {
          objc_enumerationMutation(v51);
        }
        long long v55 = (void *)[*(id *)(*((void *)&v85 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v5 addAttribution:v55];
      }
      uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v85 objects:v116 count:16];
    }
    while (v52);
  }

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v56 = self->_sources;
  uint64_t v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v81 objects:v115 count:16];
  if (v57)
  {
    uint64_t v58 = *(void *)v82;
    do
    {
      for (kuint64_t k = 0; kk != v57; ++kk)
      {
        if (*(void *)v82 != v58) {
          objc_enumerationMutation(v56);
        }
        v60 = (void *)[*(id *)(*((void *)&v81 + 1) + 8 * kk) copyWithZone:a3];
        [(id)v5 addSource:v60];
      }
      uint64_t v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v81 objects:v115 count:16];
    }
    while (v57);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v61 = self->_starRatings;
  uint64_t v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v77 objects:v114 count:16];
  if (v62)
  {
    uint64_t v63 = *(void *)v78;
    do
    {
      for (muint64_t m = 0; mm != v62; ++mm)
      {
        if (*(void *)v78 != v63) {
          objc_enumerationMutation(v61);
        }
        v65 = (void *)[*(id *)(*((void *)&v77 + 1) + 8 * mm) copyWithZone:a3];
        [(id)v5 addStarRating:v65];
      }
      uint64_t v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v77 objects:v114 count:16];
    }
    while (v62);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v66 = self->_placeDataAmendments;
  uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v73 objects:v113 count:16];
  if (v67)
  {
    uint64_t v68 = *(void *)v74;
    do
    {
      for (nuint64_t n = 0; nn != v67; ++nn)
      {
        if (*(void *)v74 != v68) {
          objc_enumerationMutation(v66);
        }
        v70 = objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * nn), "copyWithZone:", a3, (void)v73);
        [(id)v5 addPlaceDataAmendment:v70];
      }
      uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v73 objects:v113 count:16];
    }
    while (v67);
  }

  v71 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v71;
LABEL_80:

  return (id)v5;
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
      id v8 = (int *)&readAll__recursiveTag_262;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_263;
    }
    GEOBusinessReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOBusinessCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOBusiness)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOBusiness;
  v2 = [(GEOBusiness *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOBusiness)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOBusiness;
  BOOL v3 = [(GEOBusiness *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (unint64_t)uID
{
  return self->_uID;
}

- (void)setHasUID:(BOOL)a3
{
  self->_flags = ($23BF971E30E7E59058E9414629412EE4)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x80000);
}

- (BOOL)hasUID
{
  return *(_DWORD *)&self->_flags & 1;
}

- (NSString)name
{
  -[GEOBusiness _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)_readPhoneticName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 177) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoneticName_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasPhoneticName
{
  return self->_phoneticName != 0;
}

- (NSString)phoneticName
{
  -[GEOBusiness _readPhoneticName]((uint64_t)self);
  phoneticName = self->_phoneticName;

  return phoneticName;
}

- (void)setPhoneticName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x81000u;
  objc_storeStrong((id *)&self->_phoneticName, a3);
}

- (void)_readTelephone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 178) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTelephone_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasTelephone
{
  return self->_telephone != 0;
}

- (NSString)telephone
{
  -[GEOBusiness _readTelephone]((uint64_t)self);
  telephone = self->_telephone;

  return telephone;
}

- (void)_readURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 176) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasURL
{
  return self->_uRL != 0;
}

- (NSString)uRL
{
  -[GEOBusiness _readURL]((uint64_t)self);
  uRL = self->_uRL;

  return uRL;
}

- (BOOL)isClosed
{
  return self->_isClosed;
}

- (void)setHasIsClosed:(BOOL)a3
{
  if (a3) {
    int v3 = 524290;
  }
  else {
    int v3 = 0x80000;
  }
  self->_flags = ($23BF971E30E7E59058E9414629412EE4)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasIsClosed
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readMapsURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 177) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasMapsURL
{
  return self->_mapsURL != 0;
}

- (NSString)mapsURL
{
  -[GEOBusiness _readMapsURL]((uint64_t)self);
  mapsURL = self->_mapsURL;

  return mapsURL;
}

- (void)setMapsURL:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80200u;
  objc_storeStrong((id *)&self->_mapsURL, a3);
}

- (void)_readRatings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 177) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRatings_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)ratings
{
  -[GEOBusiness _readRatings]((uint64_t)self);
  ratings = self->_ratings;

  return ratings;
}

- (void)setRatings:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  ratings = self->_ratings;
  self->_ratings = v4;
}

- (void)clearRatings
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  ratings = self->_ratings;

  [(NSMutableArray *)ratings removeAllObjects];
}

- (void)addRating:(id)a3
{
  id v4 = a3;
  -[GEOBusiness _readRatings]((uint64_t)self);
  -[GEOBusiness _addNoFlagsRating:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsRating:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 128);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v5;

      id v4 = *(void **)(a1 + 128);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)ratingsCount
{
  -[GEOBusiness _readRatings]((uint64_t)self);
  ratings = self->_ratings;

  return [(NSMutableArray *)ratings count];
}

- (id)ratingAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readRatings]((uint64_t)self);
  ratings = self->_ratings;

  return (id)[(NSMutableArray *)ratings objectAtIndex:a3];
}

+ (Class)ratingType
{
  return (Class)objc_opt_class();
}

- (void)_readCategorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 176) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategorys_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)categorys
{
  -[GEOBusiness _readCategorys]((uint64_t)self);
  categorys = self->_categorys;

  return categorys;
}

- (void)setCategorys:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  categorys = self->_categorys;
  self->_categorys = v4;
}

- (void)clearCategorys
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  categorys = self->_categorys;

  [(NSMutableArray *)categorys removeAllObjects];
}

- (void)addCategory:(id)a3
{
  id v4 = a3;
  -[GEOBusiness _readCategorys]((uint64_t)self);
  -[GEOBusiness _addNoFlagsCategory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsCategory:(uint64_t)a1
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

- (unint64_t)categorysCount
{
  -[GEOBusiness _readCategorys]((uint64_t)self);
  categorys = self->_categorys;

  return [(NSMutableArray *)categorys count];
}

- (id)categoryAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readCategorys]((uint64_t)self);
  categorys = self->_categorys;

  return (id)[(NSMutableArray *)categorys objectAtIndex:a3];
}

+ (Class)categoryType
{
  return (Class)objc_opt_class();
}

- (NSMutableArray)photos
{
  -[GEOBusiness _readPhotos]((uint64_t)self);
  photos = self->_photos;

  return photos;
}

- (void)setPhotos:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  photos = self->_photos;
  self->_photos = v4;
}

- (void)clearPhotos
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  photos = self->_photos;

  [(NSMutableArray *)photos removeAllObjects];
}

- (unint64_t)photosCount
{
  -[GEOBusiness _readPhotos]((uint64_t)self);
  photos = self->_photos;

  return [(NSMutableArray *)photos count];
}

- (id)photoAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readPhotos]((uint64_t)self);
  photos = self->_photos;

  return (id)[(NSMutableArray *)photos objectAtIndex:a3];
}

+ (Class)photoType
{
  return (Class)objc_opt_class();
}

- (void)_readAttributeKeyValues
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 176) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributeKeyValues_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)attributeKeyValues
{
  -[GEOBusiness _readAttributeKeyValues]((uint64_t)self);
  attributeKeyValues = self->_attributeKeyValues;

  return attributeKeyValues;
}

- (void)setAttributeKeyValues:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  attributeKeyValues = self->_attributeKeyValues;
  self->_attributeKeyValues = v4;
}

- (void)clearAttributeKeyValues
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  attributeKeyValues = self->_attributeKeyValues;

  [(NSMutableArray *)attributeKeyValues removeAllObjects];
}

- (void)addAttributeKeyValue:(id)a3
{
  id v4 = a3;
  -[GEOBusiness _readAttributeKeyValues]((uint64_t)self);
  -[GEOBusiness _addNoFlagsAttributeKeyValue:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsAttributeKeyValue:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)attributeKeyValuesCount
{
  -[GEOBusiness _readAttributeKeyValues]((uint64_t)self);
  attributeKeyValues = self->_attributeKeyValues;

  return [(NSMutableArray *)attributeKeyValues count];
}

- (id)attributeKeyValueAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readAttributeKeyValues]((uint64_t)self);
  attributeKeyValues = self->_attributeKeyValues;

  return (id)[(NSMutableArray *)attributeKeyValues objectAtIndex:a3];
}

+ (Class)attributeKeyValueType
{
  return (Class)objc_opt_class();
}

- (void)_readOpenHours
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 177) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOpenHours_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)openHours
{
  -[GEOBusiness _readOpenHours]((uint64_t)self);
  openHours = self->_openHours;

  return openHours;
}

- (void)setOpenHours:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  openHours = self->_openHours;
  self->_openHours = v4;
}

- (void)clearOpenHours
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  openHours = self->_openHours;

  [(NSMutableArray *)openHours removeAllObjects];
}

- (void)addOpenHours:(id)a3
{
  id v4 = a3;
  -[GEOBusiness _readOpenHours]((uint64_t)self);
  -[GEOBusiness _addNoFlagsOpenHours:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsOpenHours:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      id v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)openHoursCount
{
  -[GEOBusiness _readOpenHours]((uint64_t)self);
  openHours = self->_openHours;

  return [(NSMutableArray *)openHours count];
}

- (id)openHoursAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readOpenHours]((uint64_t)self);
  openHours = self->_openHours;

  return (id)[(NSMutableArray *)openHours objectAtIndex:a3];
}

+ (Class)openHoursType
{
  return (Class)objc_opt_class();
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 176) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_8);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasCenter
{
  return self->_center != 0;
}

- (GEOLatLng)center
{
  -[GEOBusiness _readCenter]((uint64_t)self);
  center = self->_center;

  return center;
}

- (void)setCenter:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80080u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (NSMutableArray)localizedCategories
{
  -[GEOBusiness _readLocalizedCategories]((uint64_t)self);
  localizedCategories = self->_localizedCategories;

  return localizedCategories;
}

- (void)setLocalizedCategories:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  localizedCategories = self->_localizedCategories;
  self->_localizedCategories = v4;
}

- (void)clearLocalizedCategories
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  localizedCategories = self->_localizedCategories;

  [(NSMutableArray *)localizedCategories removeAllObjects];
}

- (unint64_t)localizedCategoriesCount
{
  -[GEOBusiness _readLocalizedCategories]((uint64_t)self);
  localizedCategories = self->_localizedCategories;

  return [(NSMutableArray *)localizedCategories count];
}

- (id)localizedCategoriesAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readLocalizedCategories]((uint64_t)self);
  localizedCategories = self->_localizedCategories;

  return (id)[(NSMutableArray *)localizedCategories objectAtIndex:a3];
}

+ (Class)localizedCategoriesType
{
  return (Class)objc_opt_class();
}

- (void)_readAttributions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 176) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributions_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)attributions
{
  -[GEOBusiness _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return attributions;
}

- (void)setAttributions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  attributions = self->_attributions;
  self->_attributions = v4;
}

- (void)clearAttributions
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  attributions = self->_attributions;

  [(NSMutableArray *)attributions removeAllObjects];
}

- (void)addAttribution:(id)a3
{
  id v4 = a3;
  -[GEOBusiness _readAttributions]((uint64_t)self);
  -[GEOBusiness _addNoFlagsAttribution:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsAttribution:(uint64_t)a1
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

- (unint64_t)attributionsCount
{
  -[GEOBusiness _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return [(NSMutableArray *)attributions count];
}

- (id)attributionAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return (id)[(NSMutableArray *)attributions objectAtIndex:a3];
}

+ (Class)attributionType
{
  return (Class)objc_opt_class();
}

- (NSMutableArray)sources
{
  -[GEOBusiness _readSources]((uint64_t)self);
  sources = self->_sources;

  return sources;
}

- (void)setSources:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  sources = self->_sources;
  self->_sources = v4;
}

- (void)clearSources
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  sources = self->_sources;

  [(NSMutableArray *)sources removeAllObjects];
}

- (unint64_t)sourcesCount
{
  -[GEOBusiness _readSources]((uint64_t)self);
  sources = self->_sources;

  return [(NSMutableArray *)sources count];
}

- (id)sourceAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readSources]((uint64_t)self);
  sources = self->_sources;

  return (id)[(NSMutableArray *)sources objectAtIndex:a3];
}

+ (Class)sourceType
{
  return (Class)objc_opt_class();
}

- (void)_readStarRatings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 178) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStarRatings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)starRatings
{
  -[GEOBusiness _readStarRatings]((uint64_t)self);
  starRatings = self->_starRatings;

  return starRatings;
}

- (void)setStarRatings:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  starRatings = self->_starRatings;
  self->_starRatings = v4;
}

- (void)clearStarRatings
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  starRatings = self->_starRatings;

  [(NSMutableArray *)starRatings removeAllObjects];
}

- (void)addStarRating:(id)a3
{
  id v4 = a3;
  -[GEOBusiness _readStarRatings]((uint64_t)self);
  -[GEOBusiness _addNoFlagsStarRating:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsStarRating:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 144);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = v5;

      id v4 = *(void **)(a1 + 144);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)starRatingsCount
{
  -[GEOBusiness _readStarRatings]((uint64_t)self);
  starRatings = self->_starRatings;

  return [(NSMutableArray *)starRatings count];
}

- (id)starRatingAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readStarRatings]((uint64_t)self);
  starRatings = self->_starRatings;

  return (id)[(NSMutableArray *)starRatings objectAtIndex:a3];
}

+ (Class)starRatingType
{
  return (Class)objc_opt_class();
}

- (void)_readPlaceDataAmendments
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 177) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceDataAmendments_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)placeDataAmendments
{
  -[GEOBusiness _readPlaceDataAmendments]((uint64_t)self);
  placeDataAmendments = self->_placeDataAmendments;

  return placeDataAmendments;
}

- (void)setPlaceDataAmendments:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  placeDataAmendments = self->_placeDataAmendments;
  self->_placeDataAmendments = v4;
}

- (void)clearPlaceDataAmendments
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  placeDataAmendments = self->_placeDataAmendments;

  [(NSMutableArray *)placeDataAmendments removeAllObjects];
}

- (void)addPlaceDataAmendment:(id)a3
{
  id v4 = a3;
  -[GEOBusiness _readPlaceDataAmendments]((uint64_t)self);
  -[GEOBusiness _addNoFlagsPlaceDataAmendment:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsPlaceDataAmendment:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 120);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = v5;

      id v4 = *(void **)(a1 + 120);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)placeDataAmendmentsCount
{
  -[GEOBusiness _readPlaceDataAmendments]((uint64_t)self);
  placeDataAmendments = self->_placeDataAmendments;

  return [(NSMutableArray *)placeDataAmendments count];
}

- (id)placeDataAmendmentAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readPlaceDataAmendments]((uint64_t)self);
  placeDataAmendments = self->_placeDataAmendments;

  return (id)[(NSMutableArray *)placeDataAmendments objectAtIndex:a3];
}

+ (Class)placeDataAmendmentType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOBusiness;
  id v4 = [(GEOBusiness *)&v8 description];
  id v5 = [(GEOBusiness *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOBusiness _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 176))
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      if (a2) {
        objc_super v6 = @"uID";
      }
      else {
        objc_super v6 = @"UID";
      }
      [v4 setObject:v5 forKey:v6];
    }
    id v7 = [(id)a1 name];
    if (v7) {
      [v4 setObject:v7 forKey:@"name"];
    }

    objc_super v8 = [(id)a1 phoneticName];
    if (v8) {
      [v4 setObject:v8 forKey:@"phoneticName"];
    }

    uint64_t v9 = [(id)a1 telephone];
    if (v9) {
      [v4 setObject:v9 forKey:@"telephone"];
    }

    v10 = [(id)a1 uRL];
    if (v10)
    {
      if (a2) {
        uint64_t v11 = @"uRL";
      }
      else {
        uint64_t v11 = @"URL";
      }
      [v4 setObject:v10 forKey:v11];
    }

    if ((*(unsigned char *)(a1 + 176) & 2) != 0)
    {
      id v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 172)];
      [v4 setObject:v12 forKey:@"isClosed"];
    }
    uint64_t v13 = [(id)a1 mapsURL];
    if (v13) {
      [v4 setObject:v13 forKey:@"mapsURL"];
    }

    if ([*(id *)(a1 + 128) count])
    {
      id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
      long long v123 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      id v15 = *(id *)(a1 + 128);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v123 objects:v134 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v124;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v124 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v123 + 1) + 8 * i);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            uint64_t v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v123 objects:v134 count:16];
        }
        while (v17);
      }

      [v4 setObject:v14 forKey:@"rating"];
    }
    if (*(void *)(a1 + 56))
    {
      int v22 = [(id)a1 categorys];
      [v4 setObject:v22 forKey:@"category"];
    }
    if ([*(id *)(a1 + 112) count])
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
      long long v119 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v24 = *(id *)(a1 + 112);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v119 objects:v133 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v120;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v120 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void **)(*((void *)&v119 + 1) + 8 * j);
            if (a2) {
              [v29 jsonRepresentation];
            }
            else {
            uint64_t v30 = [v29 dictionaryRepresentation];
            }
            [v23 addObject:v30];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v119 objects:v133 count:16];
        }
        while (v26);
      }

      [v4 setObject:v23 forKey:@"photo"];
    }
    if ([*(id *)(a1 + 40) count])
    {
      uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v115 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id v32 = *(id *)(a1 + 40);
      uint64_t v33 = [v32 countByEnumeratingWithState:&v115 objects:v132 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v116;
        do
        {
          for (uint64_t k = 0; k != v34; ++k)
          {
            if (*(void *)v116 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v115 + 1) + 8 * k);
            if (a2) {
              [v37 jsonRepresentation];
            }
            else {
            v38 = [v37 dictionaryRepresentation];
            }
            [v31 addObject:v38];
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v115 objects:v132 count:16];
        }
        while (v34);
      }

      [v4 setObject:v31 forKey:@"attributeKeyValue"];
    }
    if ([*(id *)(a1 + 96) count])
    {
      uint64_t v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      id v40 = *(id *)(a1 + 96);
      uint64_t v41 = [v40 countByEnumeratingWithState:&v111 objects:v131 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v112;
        do
        {
          for (uint64_t m = 0; m != v42; ++m)
          {
            if (*(void *)v112 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = *(void **)(*((void *)&v111 + 1) + 8 * m);
            if (a2) {
              [v45 jsonRepresentation];
            }
            else {
            id v46 = [v45 dictionaryRepresentation];
            }
            [v39 addObject:v46];
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v111 objects:v131 count:16];
        }
        while (v42);
      }

      [v4 setObject:v39 forKey:@"openHours"];
    }
    uint64_t v47 = [(id)a1 center];
    uint64_t v48 = v47;
    if (v47)
    {
      if (a2) {
        [v47 jsonRepresentation];
      }
      else {
      long long v49 = [v47 dictionaryRepresentation];
      }
      [v4 setObject:v49 forKey:@"center"];
    }
    if ([*(id *)(a1 + 72) count])
    {
      long long v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      id v51 = *(id *)(a1 + 72);
      uint64_t v52 = [v51 countByEnumeratingWithState:&v107 objects:v130 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v108;
        do
        {
          for (uint64_t n = 0; n != v53; ++n)
          {
            if (*(void *)v108 != v54) {
              objc_enumerationMutation(v51);
            }
            long long v56 = *(void **)(*((void *)&v107 + 1) + 8 * n);
            if (a2) {
              [v56 jsonRepresentation];
            }
            else {
            uint64_t v57 = [v56 dictionaryRepresentation];
            }
            [v50 addObject:v57];
          }
          uint64_t v53 = [v51 countByEnumeratingWithState:&v107 objects:v130 count:16];
        }
        while (v53);
      }

      [v4 setObject:v50 forKey:@"localizedCategories"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      uint64_t v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v103 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v59 = *(id *)(a1 + 48);
      uint64_t v60 = [v59 countByEnumeratingWithState:&v103 objects:v129 count:16];
      if (v60)
      {
        uint64_t v61 = v60;
        uint64_t v62 = *(void *)v104;
        do
        {
          for (iuint64_t i = 0; ii != v61; ++ii)
          {
            if (*(void *)v104 != v62) {
              objc_enumerationMutation(v59);
            }
            v64 = *(void **)(*((void *)&v103 + 1) + 8 * ii);
            if (a2) {
              [v64 jsonRepresentation];
            }
            else {
            v65 = [v64 dictionaryRepresentation];
            }
            [v58 addObject:v65];
          }
          uint64_t v61 = [v59 countByEnumeratingWithState:&v103 objects:v129 count:16];
        }
        while (v61);
      }

      [v4 setObject:v58 forKey:@"attribution"];
    }
    if ([*(id *)(a1 + 136) count])
    {
      v66 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v67 = *(id *)(a1 + 136);
      uint64_t v68 = [v67 countByEnumeratingWithState:&v99 objects:v128 count:16];
      if (v68)
      {
        uint64_t v69 = v68;
        uint64_t v70 = *(void *)v100;
        do
        {
          for (juint64_t j = 0; jj != v69; ++jj)
          {
            if (*(void *)v100 != v70) {
              objc_enumerationMutation(v67);
            }
            v72 = *(void **)(*((void *)&v99 + 1) + 8 * jj);
            if (a2) {
              [v72 jsonRepresentation];
            }
            else {
            long long v73 = [v72 dictionaryRepresentation];
            }
            [v66 addObject:v73];
          }
          uint64_t v69 = [v67 countByEnumeratingWithState:&v99 objects:v128 count:16];
        }
        while (v69);
      }

      [v4 setObject:v66 forKey:@"source"];
    }
    if (*(void *)(a1 + 144))
    {
      long long v74 = [(id)a1 starRatings];
      if (a2) {
        long long v75 = @"starRating";
      }
      else {
        long long v75 = @"star_rating";
      }
      [v4 setObject:v74 forKey:v75];
    }
    if ([*(id *)(a1 + 120) count])
    {
      long long v76 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 120), "count"));
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v77 = *(id *)(a1 + 120);
      uint64_t v78 = [v77 countByEnumeratingWithState:&v95 objects:v127 count:16];
      if (v78)
      {
        uint64_t v79 = v78;
        uint64_t v80 = *(void *)v96;
        do
        {
          for (kuint64_t k = 0; kk != v79; ++kk)
          {
            if (*(void *)v96 != v80) {
              objc_enumerationMutation(v77);
            }
            long long v82 = *(void **)(*((void *)&v95 + 1) + 8 * kk);
            if (a2) {
              [v82 jsonRepresentation];
            }
            else {
            long long v83 = [v82 dictionaryRepresentation];
            }
            [v76 addObject:v83];
          }
          uint64_t v79 = [v77 countByEnumeratingWithState:&v95 objects:v127 count:16];
        }
        while (v79);
      }

      if (a2) {
        long long v84 = @"placeDataAmendment";
      }
      else {
        long long v84 = @"place_data_amendment";
      }
      [v4 setObject:v76 forKey:v84];
    }
    long long v85 = *(void **)(a1 + 16);
    if (v85)
    {
      long long v86 = [v85 dictionaryRepresentation];
      long long v87 = v86;
      if (a2)
      {
        long long v88 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v86, "count"));
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __41__GEOBusiness__dictionaryRepresentation___block_invoke;
        v93[3] = &unk_1E53D8860;
        id v89 = v88;
        id v94 = v89;
        [v87 enumerateKeysAndObjectsUsingBlock:v93];
        id v90 = v89;

        long long v87 = v90;
      }
      [v4 setObject:v87 forKey:@"Unknown Fields"];
    }
    id v91 = v4;
  }
  else
  {
    id v91 = 0;
  }

  return v91;
}

- (id)jsonRepresentation
{
  return -[GEOBusiness _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOBusiness__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (GEOBusiness)initWithDictionary:(id)a3
{
  return (GEOBusiness *)-[GEOBusiness _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v265 = *MEMORY[0x1E4F143B8];
  id v180 = a2;
  if (a1)
  {
    a1 = (id)[a1 init];

    v191 = a1;
    if (a1)
    {
      if (a3) {
        id v4 = @"uID";
      }
      else {
        id v4 = @"UID";
      }
      id v5 = [v180 objectForKeyedSubscript:v4];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v191, "setUID:", objc_msgSend(v5, "unsignedLongLongValue"));
      }

      objc_super v6 = [v180 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = (void *)[v6 copy];
        [v191 setName:v7];
      }
      objc_super v8 = [v180 objectForKeyedSubscript:@"phoneticName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = (void *)[v8 copy];
        [v191 setPhoneticName:v9];
      }
      id v10 = [v180 objectForKeyedSubscript:@"telephone"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = (void *)[v10 copy];
        [v191 setTelephone:v11];
      }
      if (a3) {
        id v12 = @"uRL";
      }
      else {
        id v12 = @"URL";
      }
      v181 = v12;
      uint64_t v13 = objc_msgSend(v180, "objectForKeyedSubscript:");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = (void *)[v13 copy];
        [v191 setURL:v14];
      }
      id v15 = [v180 objectForKeyedSubscript:@"isClosed"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v191, "setIsClosed:", objc_msgSend(v15, "BOOLValue"));
      }

      uint64_t v16 = [v180 objectForKeyedSubscript:@"mapsURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v17 = (void *)[v16 copy];
        [v191 setMapsURL:v17];
      }
      v179 = [v180 objectForKeyedSubscript:@"rating"];
      objc_opt_class();
      uint64_t v18 = v179;
      if (objc_opt_isKindOfClass())
      {
        long long v240 = 0u;
        long long v241 = 0u;
        long long v238 = 0u;
        long long v239 = 0u;
        obuint64_t j = v179;
        uint64_t v184 = [obj countByEnumeratingWithState:&v238 objects:v259 count:16];
        if (v184)
        {
          v19 = @"is_china_suppressed";
          uint64_t v183 = *(void *)v239;
          if (a3) {
            v19 = @"isChinaSuppressed";
          }
          v193 = v19;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v239 != v183)
              {
                uint64_t v21 = v20;
                objc_enumerationMutation(obj);
                uint64_t v20 = v21;
              }
              v187 = v20;
              int v22 = *(void **)(*((void *)&v238 + 1) + 8 * (void)v20);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = [GEORating alloc];
                if (v23)
                {
                  id v189 = v22;
                  uint64_t v195 = [(GEORating *)v23 init];
                  if (v195)
                  {
                    id v24 = [v189 objectForKeyedSubscript:@"score"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      [v24 doubleValue];
                      *(_WORD *)(v195 + 92) |= 0x200u;
                      *(_WORD *)(v195 + 92) |= 2u;
                      *(void *)(v195 + 64) = v25;
                    }

                    uint64_t v26 = [v189 objectForKeyedSubscript:@"maxScore"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      [v26 doubleValue];
                      *(_WORD *)(v195 + 92) |= 0x200u;
                      *(_WORD *)(v195 + 92) |= 1u;
                      *(void *)(v195 + 32) = v27;
                    }

                    uint64_t v28 = [v189 objectForKeyedSubscript:@"numberOfRatings"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      int v29 = [v28 intValue];
                      *(_WORD *)(v195 + 92) |= 0x200u;
                      *(_WORD *)(v195 + 92) |= 4u;
                      *(_DWORD *)(v195 + 84) = v29;
                    }

                    uint64_t v30 = [v189 objectForKeyedSubscript:@"provider"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v31 = (void *)[v30 copy];
                      id v32 = v31;
                      *(_WORD *)(v195 + 92) |= 0x40u;
                      *(_WORD *)(v195 + 92) |= 0x200u;
                      objc_storeStrong((id *)(v195 + 40), v31);
                    }
                    uint64_t v33 = [v189 objectForKeyedSubscript:v181];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v34 = (void *)[v33 copy];
                      id v35 = v34;
                      *(_WORD *)(v195 + 92) |= 0x20u;
                      *(_WORD *)(v195 + 92) |= 0x200u;
                      objc_storeStrong((id *)(v195 + 24), v34);
                    }
                    v185 = [v189 objectForKeyedSubscript:@"review"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v263 = 0u;
                      long long v262 = 0u;
                      long long v261 = 0u;
                      long long v260 = 0u;
                      id v198 = v185;
                      uint64_t v36 = [v198 countByEnumeratingWithState:&v260 objects:v264 count:16];
                      if (v36)
                      {
                        uint64_t v200 = *(void *)v261;
                        do
                        {
                          uint64_t v37 = 0;
                          do
                          {
                            if (*(void *)v261 != v200) {
                              objc_enumerationMutation(v198);
                            }
                            v38 = *(void **)(*((void *)&v260 + 1) + 8 * v37);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              uint64_t v39 = [GEOReview alloc];
                              if (v39)
                              {
                                id v40 = v38;
                                uint64_t v41 = [(GEOReview *)v39 init];
                                if (v41)
                                {
                                  uint64_t v42 = [v40 objectForKeyedSubscript:@"snippet"];
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    uint64_t v43 = (void *)[v42 copy];
                                    id v44 = v43;
                                    *(_WORD *)(v41 + 88) |= 0x40u;
                                    *(_WORD *)(v41 + 88) |= 0x100u;
                                    objc_storeStrong((id *)(v41 + 56), v43);
                                  }
                                  v45 = [v40 objectForKeyedSubscript:@"score"];
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    [v45 doubleValue];
                                    *(_WORD *)(v41 + 88) |= 0x100u;
                                    *(_WORD *)(v41 + 88) |= 2u;
                                    *(void *)(v41 + 48) = v46;
                                  }

                                  uint64_t v47 = [v40 objectForKeyedSubscript:@"reviewTime"];
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    [v47 doubleValue];
                                    *(_WORD *)(v41 + 88) |= 0x100u;
                                    *(_WORD *)(v41 + 88) |= 1u;
                                    *(void *)(v41 + 32) = v48;
                                  }

                                  long long v49 = [v40 objectForKeyedSubscript:@"reviewer"];
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    long long v50 = [GEOUser alloc];
                                    if (v50)
                                    {
                                      id v51 = v49;
                                      uint64_t v52 = [(GEOUser *)v50 init];
                                      if (v52)
                                      {
                                        uint64_t v53 = [v51 objectForKeyedSubscript:@"name"];
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          uint64_t v54 = (void *)[v53 copy];
                                          id v55 = v54;
                                          *(unsigned char *)(v52 + 52) |= 4u;
                                          *(unsigned char *)(v52 + 52) |= 8u;
                                          objc_storeStrong((id *)(v52 + 32), v54);
                                        }
                                        long long v56 = [v51 objectForKeyedSubscript:@"image"];
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          uint64_t v57 = [GEOPhoto alloc];
                                          if (a3) {
                                            uint64_t v58 = [(GEOPhoto *)v57 initWithJSON:v56];
                                          }
                                          else {
                                            uint64_t v58 = [(GEOPhoto *)v57 initWithDictionary:v56];
                                          }
                                          id v59 = v58;
                                          uint64_t v60 = v58;
                                          *(unsigned char *)(v52 + 52) |= 2u;
                                          *(unsigned char *)(v52 + 52) |= 8u;
                                          objc_storeStrong((id *)(v52 + 24), v59);
                                        }
                                      }
                                    }
                                    else
                                    {
                                      uint64_t v52 = 0;
                                    }
                                    id v61 = (id)v52;
                                    *(_WORD *)(v41 + 88) |= 0x20u;
                                    *(_WORD *)(v41 + 88) |= 0x100u;
                                    objc_storeStrong((id *)(v41 + 40), (id)v52);
                                  }
                                  uint64_t v62 = [v40 objectForKeyedSubscript:@"uid"];
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    uint64_t v63 = (void *)[v62 copy];
                                    id v64 = v63;
                                    *(_WORD *)(v41 + 88) |= 0x80u;
                                    *(_WORD *)(v41 + 88) |= 0x100u;
                                    objc_storeStrong((id *)(v41 + 64), v63);
                                  }
                                  v65 = [v40 objectForKeyedSubscript:@"languageCode"];
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    v66 = (void *)[v65 copy];
                                    id v67 = v66;
                                    *(_WORD *)(v41 + 88) |= 0x10u;
                                    *(_WORD *)(v41 + 88) |= 0x100u;
                                    objc_storeStrong((id *)(v41 + 24), v66);
                                  }
                                  uint64_t v68 = [v40 objectForKeyedSubscript:v193];
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    char v69 = [v68 BOOLValue];
                                    *(_WORD *)(v41 + 88) |= 0x100u;
                                    *(_WORD *)(v41 + 88) |= 4u;
                                    *(unsigned char *)(v41 + 84) = v69;
                                  }
                                }
                              }
                              else
                              {
                                uint64_t v41 = 0;
                              }
                              -[GEORating addReview:](v195, (void *)v41);
                            }
                            ++v37;
                          }
                          while (v36 != v37);
                          uint64_t v70 = [v198 countByEnumeratingWithState:&v260 objects:v264 count:16];
                          uint64_t v36 = v70;
                        }
                        while (v70);
                      }
                    }
                    v71 = [v189 objectForKeyedSubscript:@"numberOfReviews"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      int v72 = [v71 intValue];
                      *(_WORD *)(v195 + 92) |= 0x200u;
                      *(_WORD *)(v195 + 92) |= 8u;
                      *(_DWORD *)(v195 + 88) = v72;
                    }

                    long long v73 = [v189 objectForKeyedSubscript:@"ratingCategoryId"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v74 = (void *)[v73 copy];
                      id v75 = v74;
                      *(_WORD *)(v195 + 92) |= 0x80u;
                      *(_WORD *)(v195 + 92) |= 0x200u;
                      objc_storeStrong((id *)(v195 + 48), v74);
                    }
                  }

                  [v191 addRating:v195];
                }
                else
                {
                  uint64_t v195 = 0;
                  [v191 addRating:0];
                }
              }
              uint64_t v20 = v187 + 1;
            }
            while (v187 + 1 != (char *)v184);
            uint64_t v76 = [obj countByEnumeratingWithState:&v238 objects:v259 count:16];
            uint64_t v184 = v76;
          }
          while (v76);
        }

        uint64_t v18 = v179;
      }

      id v77 = [v180 objectForKeyedSubscript:@"category"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v236 = 0u;
        long long v237 = 0u;
        long long v234 = 0u;
        long long v235 = 0u;
        id v78 = v77;
        uint64_t v79 = [v78 countByEnumeratingWithState:&v234 objects:v258 count:16];
        if (v79)
        {
          uint64_t v80 = *(void *)v235;
          do
          {
            for (uint64_t i = 0; i != v79; ++i)
            {
              if (*(void *)v235 != v80) {
                objc_enumerationMutation(v78);
              }
              long long v82 = *(void **)(*((void *)&v234 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v83 = (void *)[v82 copy];
                [v191 addCategory:v83];
              }
            }
            uint64_t v79 = [v78 countByEnumeratingWithState:&v234 objects:v258 count:16];
          }
          while (v79);
        }
      }
      long long v84 = [v180 objectForKeyedSubscript:@"photo"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v232 = 0u;
        long long v233 = 0u;
        long long v230 = 0u;
        long long v231 = 0u;
        id v85 = v84;
        uint64_t v86 = [v85 countByEnumeratingWithState:&v230 objects:v257 count:16];
        if (v86)
        {
          uint64_t v87 = *(void *)v231;
          do
          {
            for (uint64_t j = 0; j != v86; ++j)
            {
              if (*(void *)v231 != v87) {
                objc_enumerationMutation(v85);
              }
              uint64_t v89 = *(void *)(*((void *)&v230 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v90 = [GEOPhoto alloc];
                if (a3) {
                  uint64_t v91 = [(GEOPhoto *)v90 initWithJSON:v89];
                }
                else {
                  uint64_t v91 = [(GEOPhoto *)v90 initWithDictionary:v89];
                }
                long long v92 = (void *)v91;
                [v191 addPhoto:v91];
              }
            }
            uint64_t v86 = [v85 countByEnumeratingWithState:&v230 objects:v257 count:16];
          }
          while (v86);
        }
      }
      long long v93 = [v180 objectForKeyedSubscript:@"attributeKeyValue"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v228 = 0u;
        long long v229 = 0u;
        long long v226 = 0u;
        long long v227 = 0u;
        id v94 = v93;
        uint64_t v95 = [v94 countByEnumeratingWithState:&v226 objects:v256 count:16];
        if (v95)
        {
          uint64_t v96 = *(void *)v227;
          do
          {
            uint64_t v97 = 0;
            do
            {
              if (*(void *)v227 != v96) {
                objc_enumerationMutation(v94);
              }
              long long v98 = *(void **)(*((void *)&v226 + 1) + 8 * v97);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v99 = [GEOAttributeKeyValue alloc];
                if (v99) {
                  long long v100 = (void *)-[GEOAttributeKeyValue _initWithDictionary:isJSON:]((uint64_t)v99, v98);
                }
                else {
                  long long v100 = 0;
                }
                [v191 addAttributeKeyValue:v100];
              }
              ++v97;
            }
            while (v95 != v97);
            uint64_t v101 = [v94 countByEnumeratingWithState:&v226 objects:v256 count:16];
            uint64_t v95 = v101;
          }
          while (v101);
        }
      }
      v186 = [v180 objectForKeyedSubscript:@"openHours"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v224 = 0u;
        long long v225 = 0u;
        long long v222 = 0u;
        long long v223 = 0u;
        id v188 = v186;
        uint64_t v194 = [v188 countByEnumeratingWithState:&v222 objects:v255 count:16];
        if (!v194) {
          goto LABEL_202;
        }
        uint64_t v190 = *(void *)v223;
        while (1)
        {
          uint64_t v102 = 0;
          do
          {
            if (*(void *)v223 != v190)
            {
              uint64_t v103 = v102;
              objc_enumerationMutation(v188);
              uint64_t v102 = v103;
            }
            uint64_t v201 = v102;
            long long v104 = *(void **)(*((void *)&v222 + 1) + 8 * v102);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_198;
            }
            long long v105 = [GEOHours alloc];
            if (!v105)
            {
              uint64_t v106 = 0;
              goto LABEL_197;
            }
            id v199 = v104;
            uint64_t v106 = [(GEOHours *)v105 init];
            if (!v106) {
              goto LABEL_196;
            }
            v196 = [v199 objectForKeyedSubscript:@"day"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_174;
            }
            long long v248 = 0u;
            long long v249 = 0u;
            long long v246 = 0u;
            long long v247 = 0u;
            id v107 = v196;
            uint64_t v108 = [v107 countByEnumeratingWithState:&v246 objects:v264 count:16];
            if (!v108) {
              goto LABEL_173;
            }
            uint64_t v109 = *(void *)v247;
            do
            {
              for (uint64_t k = 0; k != v108; ++k)
              {
                if (*(void *)v247 != v109) {
                  objc_enumerationMutation(v107);
                }
                long long v111 = *(void **)(*((void *)&v246 + 1) + 8 * k);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v112 = v111;
                  if (([v112 isEqualToString:@"SUNDAY"] & 1) == 0
                    && ([v112 isEqualToString:@"MONDAY"] & 1) == 0
                    && ([v112 isEqualToString:@"TUESDAY"] & 1) == 0
                    && ([v112 isEqualToString:@"WEDNESDAY"] & 1) == 0
                    && ([v112 isEqualToString:@"THURSDAY"] & 1) == 0
                    && ([v112 isEqualToString:@"FRIDAY"] & 1) == 0
                    && ([v112 isEqualToString:@"SATURDAY"] & 1) == 0)
                  {
                    [v112 isEqualToString:@"EVERYDAY"];
                  }
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    continue;
                  }
                  [v111 intValue];
                }
                os_unfair_lock_lock((os_unfair_lock_t)(v106 + 64));
                if ((*(unsigned char *)(v106 + 68) & 2) == 0)
                {
                  long long v113 = *(void **)(v106 + 8);
                  if (v113)
                  {
                    id v114 = v113;
                    objc_sync_enter(v114);
                    GEOHoursReadSpecified(v106, *(void *)(v106 + 8), (int *)&_readDays_tags_1);
                    objc_sync_exit(v114);
                  }
                }
                os_unfair_lock_unlock((os_unfair_lock_t)(v106 + 64));
                PBRepeatedInt32Add();
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v106 + 68) |= 2u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v106 + 64));
                *(unsigned char *)(v106 + 68) |= 8u;
              }
              uint64_t v108 = [v107 countByEnumeratingWithState:&v246 objects:v264 count:16];
            }
            while (v108);
LABEL_173:

LABEL_174:
            v197 = [v199 objectForKeyedSubscript:@"timeRange"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v244 = 0u;
              long long v245 = 0u;
              long long v242 = 0u;
              long long v243 = 0u;
              id v115 = v197;
              uint64_t v116 = [v115 countByEnumeratingWithState:&v242 objects:&v260 count:16];
              if (v116)
              {
                uint64_t v117 = *(void *)v243;
                do
                {
                  uint64_t v118 = 0;
                  do
                  {
                    if (*(void *)v243 != v117) {
                      objc_enumerationMutation(v115);
                    }
                    long long v119 = *(void **)(*((void *)&v242 + 1) + 8 * v118);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v120 = [GEOTimeRange alloc];
                      if (v120)
                      {
                        id v121 = v119;
                        uint64_t v122 = [(GEOTimeRange *)v120 init];
                        if (v122)
                        {
                          long long v123 = [v121 objectForKeyedSubscript:@"from"];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            int v124 = [v123 unsignedIntValue];
                            *(unsigned char *)(v122 + 24) |= 1u;
                            *(_DWORD *)(v122 + 16) = v124;
                          }

                          long long v125 = [v121 objectForKeyedSubscript:@"to"];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            int v126 = [v125 unsignedIntValue];
                            *(unsigned char *)(v122 + 24) |= 2u;
                            *(_DWORD *)(v122 + 20) = v126;
                          }
                        }
                      }
                      else
                      {
                        uint64_t v122 = 0;
                      }
                      -[GEOHours addTimeRange:](v106, (void *)v122);
                    }
                    ++v118;
                  }
                  while (v116 != v118);
                  uint64_t v127 = [v115 countByEnumeratingWithState:&v242 objects:&v260 count:16];
                  uint64_t v116 = v127;
                }
                while (v127);
              }
            }
LABEL_196:

LABEL_197:
            [v191 addOpenHours:v106];

LABEL_198:
            uint64_t v102 = v201 + 1;
          }
          while (v201 + 1 != v194);
          uint64_t v128 = [v188 countByEnumeratingWithState:&v222 objects:v255 count:16];
          uint64_t v194 = v128;
          if (!v128)
          {
LABEL_202:

            break;
          }
        }
      }

      v129 = [v180 objectForKeyedSubscript:@"center"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v130 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v131 = [(GEOLatLng *)v130 initWithJSON:v129];
        }
        else {
          uint64_t v131 = [(GEOLatLng *)v130 initWithDictionary:v129];
        }
        v132 = (void *)v131;
        [v191 setCenter:v131];
      }
      v133 = [v180 objectForKeyedSubscript:@"localizedCategories"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v220 = 0u;
        long long v221 = 0u;
        long long v218 = 0u;
        long long v219 = 0u;
        id v134 = v133;
        uint64_t v135 = [v134 countByEnumeratingWithState:&v218 objects:v254 count:16];
        if (v135)
        {
          uint64_t v136 = *(void *)v219;
          do
          {
            for (uint64_t m = 0; m != v135; ++m)
            {
              if (*(void *)v219 != v136) {
                objc_enumerationMutation(v134);
              }
              uint64_t v138 = *(void *)(*((void *)&v218 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v139 = [GEOCategory alloc];
                if (a3) {
                  uint64_t v140 = [(GEOCategory *)v139 initWithJSON:v138];
                }
                else {
                  uint64_t v140 = [(GEOCategory *)v139 initWithDictionary:v138];
                }
                v141 = (void *)v140;
                [v191 addLocalizedCategories:v140];
              }
            }
            uint64_t v135 = [v134 countByEnumeratingWithState:&v218 objects:v254 count:16];
          }
          while (v135);
        }
      }
      v142 = [v180 objectForKeyedSubscript:@"attribution"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v216 = 0u;
        long long v217 = 0u;
        long long v214 = 0u;
        long long v215 = 0u;
        id v143 = v142;
        uint64_t v144 = [v143 countByEnumeratingWithState:&v214 objects:v253 count:16];
        if (v144)
        {
          uint64_t v145 = *(void *)v215;
          do
          {
            for (uint64_t n = 0; n != v144; ++n)
            {
              if (*(void *)v215 != v145) {
                objc_enumerationMutation(v143);
              }
              uint64_t v147 = *(void *)(*((void *)&v214 + 1) + 8 * n);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v148 = [GEOSearchAttribution alloc];
                if (a3) {
                  uint64_t v149 = [(GEOSearchAttribution *)v148 initWithJSON:v147];
                }
                else {
                  uint64_t v149 = [(GEOSearchAttribution *)v148 initWithDictionary:v147];
                }
                v150 = (void *)v149;
                [v191 addAttribution:v149];
              }
            }
            uint64_t v144 = [v143 countByEnumeratingWithState:&v214 objects:v253 count:16];
          }
          while (v144);
        }
      }
      v151 = [v180 objectForKeyedSubscript:@"source"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v212 = 0u;
        long long v213 = 0u;
        long long v210 = 0u;
        long long v211 = 0u;
        id v152 = v151;
        uint64_t v153 = [v152 countByEnumeratingWithState:&v210 objects:v252 count:16];
        if (v153)
        {
          uint64_t v154 = *(void *)v211;
          do
          {
            for (iuint64_t i = 0; ii != v153; ++ii)
            {
              if (*(void *)v211 != v154) {
                objc_enumerationMutation(v152);
              }
              uint64_t v156 = *(void *)(*((void *)&v210 + 1) + 8 * ii);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v157 = [GEOSource alloc];
                if (a3) {
                  uint64_t v158 = [(GEOSource *)v157 initWithJSON:v156];
                }
                else {
                  uint64_t v158 = [(GEOSource *)v157 initWithDictionary:v156];
                }
                v159 = (void *)v158;
                [v191 addSource:v158];
              }
            }
            uint64_t v153 = [v152 countByEnumeratingWithState:&v210 objects:v252 count:16];
          }
          while (v153);
        }
      }
      if (a3) {
        v160 = @"starRating";
      }
      else {
        v160 = @"star_rating";
      }
      v161 = [v180 objectForKeyedSubscript:v160];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v208 = 0u;
        long long v209 = 0u;
        long long v206 = 0u;
        long long v207 = 0u;
        id v162 = v161;
        uint64_t v163 = [v162 countByEnumeratingWithState:&v206 objects:v251 count:16];
        if (v163)
        {
          uint64_t v164 = *(void *)v207;
          do
          {
            for (juint64_t j = 0; jj != v163; ++jj)
            {
              if (*(void *)v207 != v164) {
                objc_enumerationMutation(v162);
              }
              v166 = *(void **)(*((void *)&v206 + 1) + 8 * jj);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v167 = (void *)[v166 copy];
                [v191 addStarRating:v167];
              }
            }
            uint64_t v163 = [v162 countByEnumeratingWithState:&v206 objects:v251 count:16];
          }
          while (v163);
        }
      }
      if (a3) {
        v168 = @"placeDataAmendment";
      }
      else {
        v168 = @"place_data_amendment";
      }
      v169 = [v180 objectForKeyedSubscript:v168];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v204 = 0u;
        long long v205 = 0u;
        long long v202 = 0u;
        long long v203 = 0u;
        id v170 = v169;
        uint64_t v171 = [v170 countByEnumeratingWithState:&v202 objects:v250 count:16];
        if (v171)
        {
          uint64_t v172 = *(void *)v203;
          do
          {
            for (kuint64_t k = 0; kk != v171; ++kk)
            {
              if (*(void *)v203 != v172) {
                objc_enumerationMutation(v170);
              }
              uint64_t v174 = *(void *)(*((void *)&v202 + 1) + 8 * kk);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v175 = [GEOPlaceDataAmendment alloc];
                if (a3) {
                  uint64_t v176 = [(GEOPlaceDataAmendment *)v175 initWithJSON:v174];
                }
                else {
                  uint64_t v176 = [(GEOPlaceDataAmendment *)v175 initWithDictionary:v174];
                }
                v177 = (void *)v176;
                [v191 addPlaceDataAmendment:v176];
              }
            }
            uint64_t v171 = [v170 countByEnumeratingWithState:&v202 objects:v250 count:16];
          }
          while (v171);
        }
      }
      a1 = v191;
    }
  }

  return a1;
}

- (GEOBusiness)initWithJSON:(id)a3
{
  return (GEOBusiness *)-[GEOBusiness _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOBusinessIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOBusinessReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOBusinessIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v46 = self->_reader;
    objc_sync_enter(v46);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v47 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v47];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v46);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOBusiness *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    if (self->_phoneticName) {
      PBDataWriterWriteStringField();
    }
    if (self->_telephone) {
      PBDataWriterWriteStringField();
    }
    if (self->_uRL) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_mapsURL) {
      PBDataWriterWriteStringField();
    }
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    objc_super v6 = self->_ratings;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v84 objects:v97 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v85 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v84 objects:v97 count:16];
      }
      while (v7);
    }

    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v10 = self->_categorys;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v80 objects:v96 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v81;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v81 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v80 objects:v96 count:16];
      }
      while (v11);
    }

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v14 = self->_photos;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v76 objects:v95 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v77;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v77 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v76 objects:v95 count:16];
      }
      while (v15);
    }

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v18 = self->_attributeKeyValues;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v72 objects:v94 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v73;
      do
      {
        for (uint64_t m = 0; m != v19; ++m)
        {
          if (*(void *)v73 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v72 objects:v94 count:16];
      }
      while (v19);
    }

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    int v22 = self->_openHours;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v68 objects:v93 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v69;
      do
      {
        for (uint64_t n = 0; n != v23; ++n)
        {
          if (*(void *)v69 != v24) {
            objc_enumerationMutation(v22);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v68 objects:v93 count:16];
      }
      while (v23);
    }

    if (self->_center) {
      PBDataWriterWriteSubmessage();
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v26 = self->_localizedCategories;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v64 objects:v92 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v65;
      do
      {
        for (iuint64_t i = 0; ii != v27; ++ii)
        {
          if (*(void *)v65 != v28) {
            objc_enumerationMutation(v26);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v64 objects:v92 count:16];
      }
      while (v27);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v30 = self->_attributions;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v60 objects:v91 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v61;
      do
      {
        for (juint64_t j = 0; jj != v31; ++jj)
        {
          if (*(void *)v61 != v32) {
            objc_enumerationMutation(v30);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v60 objects:v91 count:16];
      }
      while (v31);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v34 = self->_sources;
    uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v56 objects:v90 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v57;
      do
      {
        for (kuint64_t k = 0; kk != v35; ++kk)
        {
          if (*(void *)v57 != v36) {
            objc_enumerationMutation(v34);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v56 objects:v90 count:16];
      }
      while (v35);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v38 = self->_starRatings;
    uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v52 objects:v89 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v53;
      do
      {
        for (muint64_t m = 0; mm != v39; ++mm)
        {
          if (*(void *)v53 != v40) {
            objc_enumerationMutation(v38);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v52 objects:v89 count:16];
      }
      while (v39);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v42 = self->_placeDataAmendments;
    uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v48 objects:v88 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v49;
      do
      {
        for (nuint64_t n = 0; nn != v43; ++nn)
        {
          if (*(void *)v49 != v44) {
            objc_enumerationMutation(v42);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v48 objects:v88 count:16];
      }
      while (v43);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v48);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOBusiness _readCenter]((uint64_t)self);
  center = self->_center;

  return [(GEOLatLng *)center hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v45 = (id *)a3;
  [(GEOBusiness *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v45 + 1, self->_reader);
  *((_DWORD *)v45 + 40) = self->_readerMarkPos;
  *((_DWORD *)v45 + 41) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v45;
  if (*(unsigned char *)&self->_flags)
  {
    v45[3] = self->_uID;
    *((_DWORD *)v45 + 44) |= 1u;
  }
  if (self->_name)
  {
    objc_msgSend(v45, "setName:");
    id v4 = v45;
  }
  if (self->_phoneticName)
  {
    objc_msgSend(v45, "setPhoneticName:");
    id v4 = v45;
  }
  if (self->_telephone)
  {
    objc_msgSend(v45, "setTelephone:");
    id v4 = v45;
  }
  if (self->_uRL)
  {
    objc_msgSend(v45, "setURL:");
    id v4 = v45;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v4 + 172) = self->_isClosed;
    *((_DWORD *)v4 + 44) |= 2u;
  }
  if (self->_mapsURL) {
    objc_msgSend(v45, "setMapsURL:");
  }
  if ([(GEOBusiness *)self ratingsCount])
  {
    [v45 clearRatings];
    unint64_t v5 = [(GEOBusiness *)self ratingsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOBusiness *)self ratingAtIndex:i];
        [v45 addRating:v8];
      }
    }
  }
  if ([(GEOBusiness *)self categorysCount])
  {
    [v45 clearCategorys];
    unint64_t v9 = [(GEOBusiness *)self categorysCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(GEOBusiness *)self categoryAtIndex:j];
        [v45 addCategory:v12];
      }
    }
  }
  if ([(GEOBusiness *)self photosCount])
  {
    [v45 clearPhotos];
    unint64_t v13 = [(GEOBusiness *)self photosCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(GEOBusiness *)self photoAtIndex:k];
        [v45 addPhoto:v16];
      }
    }
  }
  if ([(GEOBusiness *)self attributeKeyValuesCount])
  {
    [v45 clearAttributeKeyValues];
    unint64_t v17 = [(GEOBusiness *)self attributeKeyValuesCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        uint64_t v20 = [(GEOBusiness *)self attributeKeyValueAtIndex:m];
        [v45 addAttributeKeyValue:v20];
      }
    }
  }
  if ([(GEOBusiness *)self openHoursCount])
  {
    [v45 clearOpenHours];
    unint64_t v21 = [(GEOBusiness *)self openHoursCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(GEOBusiness *)self openHoursAtIndex:n];
        [v45 addOpenHours:v24];
      }
    }
  }
  if (self->_center) {
    objc_msgSend(v45, "setCenter:");
  }
  if ([(GEOBusiness *)self localizedCategoriesCount])
  {
    [v45 clearLocalizedCategories];
    unint64_t v25 = [(GEOBusiness *)self localizedCategoriesCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        uint64_t v28 = [(GEOBusiness *)self localizedCategoriesAtIndex:ii];
        [v45 addLocalizedCategories:v28];
      }
    }
  }
  if ([(GEOBusiness *)self attributionsCount])
  {
    [v45 clearAttributions];
    unint64_t v29 = [(GEOBusiness *)self attributionsCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0; jj != v30; ++jj)
      {
        uint64_t v32 = [(GEOBusiness *)self attributionAtIndex:jj];
        [v45 addAttribution:v32];
      }
    }
  }
  if ([(GEOBusiness *)self sourcesCount])
  {
    [v45 clearSources];
    unint64_t v33 = [(GEOBusiness *)self sourcesCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (kuint64_t k = 0; kk != v34; ++kk)
      {
        uint64_t v36 = [(GEOBusiness *)self sourceAtIndex:kk];
        [v45 addSource:v36];
      }
    }
  }
  if ([(GEOBusiness *)self starRatingsCount])
  {
    [v45 clearStarRatings];
    unint64_t v37 = [(GEOBusiness *)self starRatingsCount];
    if (v37)
    {
      unint64_t v38 = v37;
      for (muint64_t m = 0; mm != v38; ++mm)
      {
        uint64_t v40 = [(GEOBusiness *)self starRatingAtIndex:mm];
        [v45 addStarRating:v40];
      }
    }
  }
  if ([(GEOBusiness *)self placeDataAmendmentsCount])
  {
    [v45 clearPlaceDataAmendments];
    unint64_t v41 = [(GEOBusiness *)self placeDataAmendmentsCount];
    if (v41)
    {
      unint64_t v42 = v41;
      for (nuint64_t n = 0; nn != v42; ++nn)
      {
        uint64_t v44 = [(GEOBusiness *)self placeDataAmendmentAtIndex:nn];
        [v45 addPlaceDataAmendment:v44];
      }
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  [(GEOBusiness *)self readAll:1];
  [v4 readAll:1];
  int v5 = *((_DWORD *)v4 + 44);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_uID != *((void *)v4 + 3)) {
      goto LABEL_47;
    }
  }
  else if (v5)
  {
    goto LABEL_47;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 11) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_47;
  }
  phoneticName = self->_phoneticName;
  if ((unint64_t)phoneticName | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](phoneticName, "isEqual:")) {
      goto LABEL_47;
    }
  }
  telephone = self->_telephone;
  if ((unint64_t)telephone | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](telephone, "isEqual:")) {
      goto LABEL_47;
    }
  }
  uRL = self->_uRL;
  if ((unint64_t)uRL | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](uRL, "isEqual:")) {
      goto LABEL_47;
    }
  }
  int v10 = *((_DWORD *)v4 + 44);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v10 & 2) != 0)
    {
      if (self->_isClosed)
      {
        if (!*((unsigned char *)v4 + 172)) {
          goto LABEL_47;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 172)) {
        goto LABEL_23;
      }
    }
LABEL_47:
    char v23 = 0;
    goto LABEL_48;
  }
  if ((v10 & 2) != 0) {
    goto LABEL_47;
  }
LABEL_23:
  mapsURL = self->_mapsURL;
  if ((unint64_t)mapsURL | *((void *)v4 + 10) && !-[NSString isEqual:](mapsURL, "isEqual:")) {
    goto LABEL_47;
  }
  ratings = self->_ratings;
  if ((unint64_t)ratings | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](ratings, "isEqual:")) {
      goto LABEL_47;
    }
  }
  categorys = self->_categorys;
  if ((unint64_t)categorys | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](categorys, "isEqual:")) {
      goto LABEL_47;
    }
  }
  photos = self->_photos;
  if ((unint64_t)photos | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](photos, "isEqual:")) {
      goto LABEL_47;
    }
  }
  attributeKeyValues = self->_attributeKeyValues;
  if ((unint64_t)attributeKeyValues | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](attributeKeyValues, "isEqual:")) {
      goto LABEL_47;
    }
  }
  openHours = self->_openHours;
  if ((unint64_t)openHours | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](openHours, "isEqual:")) {
      goto LABEL_47;
    }
  }
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 8))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_47;
    }
  }
  localizedCategories = self->_localizedCategories;
  if ((unint64_t)localizedCategories | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](localizedCategories, "isEqual:")) {
      goto LABEL_47;
    }
  }
  attributions = self->_attributions;
  if ((unint64_t)attributions | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](attributions, "isEqual:")) {
      goto LABEL_47;
    }
  }
  sources = self->_sources;
  if ((unint64_t)sources | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](sources, "isEqual:")) {
      goto LABEL_47;
    }
  }
  starRatings = self->_starRatings;
  if ((unint64_t)starRatings | *((void *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](starRatings, "isEqual:")) {
      goto LABEL_47;
    }
  }
  placeDataAmendments = self->_placeDataAmendments;
  if ((unint64_t)placeDataAmendments | *((void *)v4 + 15)) {
    char v23 = -[NSMutableArray isEqual:](placeDataAmendments, "isEqual:");
  }
  else {
    char v23 = 1;
  }
LABEL_48:

  return v23;
}

- (unint64_t)hash
{
  [(GEOBusiness *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_uID;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash];
  NSUInteger v5 = [(NSString *)self->_phoneticName hash];
  NSUInteger v6 = [(NSString *)self->_telephone hash];
  NSUInteger v7 = [(NSString *)self->_uRL hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_isClosed;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_mapsURL hash];
  uint64_t v10 = [(NSMutableArray *)self->_ratings hash];
  uint64_t v11 = v10 ^ [(NSMutableArray *)self->_categorys hash];
  uint64_t v12 = v11 ^ [(NSMutableArray *)self->_photos hash];
  uint64_t v13 = v9 ^ v12 ^ [(NSMutableArray *)self->_attributeKeyValues hash];
  uint64_t v14 = [(NSMutableArray *)self->_openHours hash];
  unint64_t v15 = v14 ^ [(GEOLatLng *)self->_center hash];
  uint64_t v16 = v15 ^ [(NSMutableArray *)self->_localizedCategories hash];
  uint64_t v17 = v16 ^ [(NSMutableArray *)self->_attributions hash];
  uint64_t v18 = v13 ^ v17 ^ [(NSMutableArray *)self->_sources hash];
  uint64_t v19 = [(NSMutableArray *)self->_starRatings hash];
  return v18 ^ v19 ^ [(NSMutableArray *)self->_placeDataAmendments hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 176))
  {
    self->_uID = *((void *)v4 + 3);
    *(_DWORD *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 11)) {
    -[GEOBusiness setName:](self, "setName:");
  }
  if (*((void *)v4 + 13)) {
    -[GEOBusiness setPhoneticName:](self, "setPhoneticName:");
  }
  if (*((void *)v4 + 19)) {
    -[GEOBusiness setTelephone:](self, "setTelephone:");
  }
  if (*((void *)v4 + 4)) {
    -[GEOBusiness setURL:](self, "setURL:");
  }
  if ((*((unsigned char *)v4 + 176) & 2) != 0)
  {
    self->_isClosed = *((unsigned char *)v4 + 172);
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 10)) {
    -[GEOBusiness setMapsURL:](self, "setMapsURL:");
  }
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v5 = *((id *)v4 + 16);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v93 objects:v106 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v94 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOBusiness *)self addRating:*(void *)(*((void *)&v93 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v93 objects:v106 count:16];
    }
    while (v7);
  }

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v10 = *((id *)v4 + 7);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v89 objects:v105 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v90;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v90 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOBusiness *)self addCategory:*(void *)(*((void *)&v89 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v89 objects:v105 count:16];
    }
    while (v12);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v15 = *((id *)v4 + 14);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v85 objects:v104 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v86;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v86 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEOBusiness *)self addPhoto:*(void *)(*((void *)&v85 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v85 objects:v104 count:16];
    }
    while (v17);
  }

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v20 = *((id *)v4 + 5);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v81 objects:v103 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v82;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v82 != v23) {
          objc_enumerationMutation(v20);
        }
        [(GEOBusiness *)self addAttributeKeyValue:*(void *)(*((void *)&v81 + 1) + 8 * m)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v81 objects:v103 count:16];
    }
    while (v22);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v25 = *((id *)v4 + 12);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v77 objects:v102 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v78;
    do
    {
      for (uint64_t n = 0; n != v27; ++n)
      {
        if (*(void *)v78 != v28) {
          objc_enumerationMutation(v25);
        }
        [(GEOBusiness *)self addOpenHours:*(void *)(*((void *)&v77 + 1) + 8 * n)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v77 objects:v102 count:16];
    }
    while (v27);
  }

  center = self->_center;
  uint64_t v31 = *((void *)v4 + 8);
  if (center)
  {
    if (v31) {
      -[GEOLatLng mergeFrom:](center, "mergeFrom:");
    }
  }
  else if (v31)
  {
    -[GEOBusiness setCenter:](self, "setCenter:");
  }
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v32 = *((id *)v4 + 9);
  uint64_t v33 = [v32 countByEnumeratingWithState:&v73 objects:v101 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v74;
    do
    {
      for (iuint64_t i = 0; ii != v34; ++ii)
      {
        if (*(void *)v74 != v35) {
          objc_enumerationMutation(v32);
        }
        [(GEOBusiness *)self addLocalizedCategories:*(void *)(*((void *)&v73 + 1) + 8 * ii)];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v73 objects:v101 count:16];
    }
    while (v34);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v37 = *((id *)v4 + 6);
  uint64_t v38 = [v37 countByEnumeratingWithState:&v69 objects:v100 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v70;
    do
    {
      for (juint64_t j = 0; jj != v39; ++jj)
      {
        if (*(void *)v70 != v40) {
          objc_enumerationMutation(v37);
        }
        [(GEOBusiness *)self addAttribution:*(void *)(*((void *)&v69 + 1) + 8 * jj)];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v69 objects:v100 count:16];
    }
    while (v39);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v42 = *((id *)v4 + 17);
  uint64_t v43 = [v42 countByEnumeratingWithState:&v65 objects:v99 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v66;
    do
    {
      for (kuint64_t k = 0; kk != v44; ++kk)
      {
        if (*(void *)v66 != v45) {
          objc_enumerationMutation(v42);
        }
        [(GEOBusiness *)self addSource:*(void *)(*((void *)&v65 + 1) + 8 * kk)];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v65 objects:v99 count:16];
    }
    while (v44);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v47 = *((id *)v4 + 18);
  uint64_t v48 = [v47 countByEnumeratingWithState:&v61 objects:v98 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v62;
    do
    {
      for (muint64_t m = 0; mm != v49; ++mm)
      {
        if (*(void *)v62 != v50) {
          objc_enumerationMutation(v47);
        }
        [(GEOBusiness *)self addStarRating:*(void *)(*((void *)&v61 + 1) + 8 * mm)];
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v61 objects:v98 count:16];
    }
    while (v49);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v52 = *((id *)v4 + 15);
  uint64_t v53 = [v52 countByEnumeratingWithState:&v57 objects:v97 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v58;
    do
    {
      for (nuint64_t n = 0; nn != v54; ++nn)
      {
        if (*(void *)v58 != v55) {
          objc_enumerationMutation(v52);
        }
        -[GEOBusiness addPlaceDataAmendment:](self, "addPlaceDataAmendment:", *(void *)(*((void *)&v57 + 1) + 8 * nn), (void)v57);
      }
      uint64_t v54 = [v52 countByEnumeratingWithState:&v57 objects:v97 count:16];
    }
    while (v54);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOBusinessReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_267);
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
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80004u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOBusiness *)self readAll:0];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v63 = self;
    obuint64_t j = self->_ratings;
    uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v96 objects:v111 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v66 = *(void *)v97;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v97 != v66) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v96 + 1) + 8 * i);
          if (v10)
          {
            os_unfair_lock_lock_with_options();
            *(_WORD *)(v10 + 92) |= 0x10u;
            *(_WORD *)(v10 + 92) |= 0x200u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 80));
            uint64_t v11 = *(void **)(v10 + 16);
            *(void *)(v10 + 16) = 0;

            -[GEORating readAll:](v10, 0);
            long long v102 = 0u;
            long long v103 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            id v12 = *(id *)(v10 + 56);
            uint64_t v13 = [v12 countByEnumeratingWithState:&v100 objects:v112 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v101;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v101 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v17 = *(void *)(*((void *)&v100 + 1) + 8 * j);
                  if (v17)
                  {
                    os_unfair_lock_lock_with_options();
                    *(_WORD *)(v17 + 88) |= 8u;
                    *(_WORD *)(v17 + 88) |= 0x100u;
                    os_unfair_lock_unlock((os_unfair_lock_t)(v17 + 80));
                    uint64_t v18 = *(void **)(v17 + 16);
                    *(void *)(v17 + 16) = 0;

                    -[GEOReview readAll:](v17, 0);
                    uint64_t v19 = *(void *)(v17 + 40);
                    if (v19)
                    {
                      os_unfair_lock_lock_with_options();
                      *(unsigned char *)(v19 + 52) |= 1u;
                      *(unsigned char *)(v19 + 52) |= 8u;
                      os_unfair_lock_unlock((os_unfair_lock_t)(v19 + 48));
                      id v20 = *(void **)(v19 + 16);
                      *(void *)(v19 + 16) = 0;

                      -[GEOUser readAll:](v19, 0);
                      [*(id *)(v19 + 24) clearUnknownFields:1];
                    }
                  }
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v100 objects:v112 count:16];
              }
              while (v14);
            }
          }
        }
        uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v96 objects:v111 count:16];
      }
      while (v8);
    }

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    uint64_t v21 = v63->_photos;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v92 objects:v110 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v93;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v93 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v92 + 1) + 8 * k) clearUnknownFields:1];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v92 objects:v110 count:16];
      }
      while (v23);
    }

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    uint64_t v26 = v63->_attributeKeyValues;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v88 objects:v109 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v89;
      do
      {
        for (uint64_t m = 0; m != v28; ++m)
        {
          if (*(void *)v89 != v29) {
            objc_enumerationMutation(v26);
          }
          -[GEOAttributeKeyValue clearUnknownFields:](*(void *)(*((void *)&v88 + 1) + 8 * m), 1);
        }
        uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v88 objects:v109 count:16];
      }
      while (v28);
    }

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    obja = v63->_openHours;
    uint64_t v31 = [(NSMutableArray *)obja countByEnumeratingWithState:&v84 objects:v108 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v67 = *(void *)v85;
      do
      {
        for (uint64_t n = 0; n != v32; ++n)
        {
          if (*(void *)v85 != v67) {
            objc_enumerationMutation(obja);
          }
          uint64_t v34 = *(void *)(*((void *)&v84 + 1) + 8 * n);
          if (v34)
          {
            os_unfair_lock_lock_with_options();
            *(unsigned char *)(v34 + 68) |= 1u;
            *(unsigned char *)(v34 + 68) |= 8u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v34 + 64));
            uint64_t v35 = *(void **)(v34 + 16);
            *(void *)(v34 + 16) = 0;

            -[GEOHours readAll:](v34, 0);
            long long v102 = 0u;
            long long v103 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            id v36 = *(id *)(v34 + 48);
            uint64_t v37 = [v36 countByEnumeratingWithState:&v100 objects:v112 count:16];
            if (v37)
            {
              uint64_t v38 = v37;
              uint64_t v39 = *(void *)v101;
              do
              {
                for (iuint64_t i = 0; ii != v38; ++ii)
                {
                  if (*(void *)v101 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  uint64_t v41 = *(void *)(*((void *)&v100 + 1) + 8 * ii);
                  if (v41)
                  {
                    id v42 = *(void **)(v41 + 8);
                    *(void *)(v41 + 8) = 0;
                  }
                }
                uint64_t v38 = [v36 countByEnumeratingWithState:&v100 objects:v112 count:16];
              }
              while (v38);
            }
          }
        }
        uint64_t v32 = [(NSMutableArray *)obja countByEnumeratingWithState:&v84 objects:v108 count:16];
      }
      while (v32);
    }

    [(GEOLatLng *)v63->_center clearUnknownFields:1];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    uint64_t v43 = v63->_localizedCategories;
    uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v80 objects:v107 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v81;
      do
      {
        for (juint64_t j = 0; jj != v45; ++jj)
        {
          if (*(void *)v81 != v46) {
            objc_enumerationMutation(v43);
          }
          [*(id *)(*((void *)&v80 + 1) + 8 * jj) clearUnknownFields:1];
        }
        uint64_t v45 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v80 objects:v107 count:16];
      }
      while (v45);
    }

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v48 = v63->_attributions;
    uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v76 objects:v106 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v77;
      do
      {
        for (kuint64_t k = 0; kk != v50; ++kk)
        {
          if (*(void *)v77 != v51) {
            objc_enumerationMutation(v48);
          }
          [*(id *)(*((void *)&v76 + 1) + 8 * kk) clearUnknownFields:1];
        }
        uint64_t v50 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v76 objects:v106 count:16];
      }
      while (v50);
    }

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v53 = v63->_sources;
    uint64_t v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v72 objects:v105 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v73;
      do
      {
        for (muint64_t m = 0; mm != v55; ++mm)
        {
          if (*(void *)v73 != v56) {
            objc_enumerationMutation(v53);
          }
          [*(id *)(*((void *)&v72 + 1) + 8 * mm) clearUnknownFields:1];
        }
        uint64_t v55 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v72 objects:v105 count:16];
      }
      while (v55);
    }

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v58 = v63->_placeDataAmendments;
    uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v68 objects:v104 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v69;
      do
      {
        for (nuint64_t n = 0; nn != v60; ++nn)
        {
          if (*(void *)v69 != v61) {
            objc_enumerationMutation(v58);
          }
          [*(id *)(*((void *)&v68 + 1) + 8 * nn) clearUnknownFields:1];
        }
        uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v68 objects:v104 count:16];
      }
      while (v60);
    }
  }
}

@end