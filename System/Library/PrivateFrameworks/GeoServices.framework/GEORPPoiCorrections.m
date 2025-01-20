@interface GEORPPoiCorrections
+ (BOOL)isValid:(id)a3;
+ (Class)businessHoursType;
- (BOOL)flagBadCuratedCollectionDescription;
- (BOOL)flagBrokenCuratedCollectionUrl;
- (BOOL)flagHoursIncorrect;
- (BOOL)flagNotAtThisAddress;
- (BOOL)hasAddress;
- (BOOL)hasAmenity;
- (BOOL)hasCategory;
- (BOOL)hasContainmentCorrections;
- (BOOL)hasFlagBadCuratedCollectionDescription;
- (BOOL)hasFlagBrokenCuratedCollectionUrl;
- (BOOL)hasFlagHoursIncorrect;
- (BOOL)hasFlagNotAtThisAddress;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHoursText;
- (BOOL)hasName;
- (BOOL)hasOriginalName;
- (BOOL)hasOriginalPhone;
- (BOOL)hasOriginalUrl;
- (BOOL)hasPhone;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPAddressCorrections)address;
- (GEORPAmenityCorrections)amenity;
- (GEORPCategoryCorrections)category;
- (GEORPPlaceContainmentCorrections)containmentCorrections;
- (GEORPPoiCorrections)init;
- (GEORPPoiCorrections)initWithData:(id)a3;
- (GEORPPoiCorrections)initWithDictionary:(id)a3;
- (GEORPPoiCorrections)initWithJSON:(id)a3;
- (NSMutableArray)businessHours;
- (NSString)hoursText;
- (NSString)name;
- (NSString)originalName;
- (NSString)originalPhone;
- (NSString)originalUrl;
- (NSString)phone;
- (NSString)url;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)businessHoursAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)businessHoursCount;
- (unint64_t)hash;
- (void)_addNoFlagsBusinessHours:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAddress;
- (void)_readAmenity;
- (void)_readBusinessHours;
- (void)_readCategory;
- (void)_readContainmentCorrections;
- (void)_readHoursText;
- (void)_readName;
- (void)_readOriginalName;
- (void)_readOriginalPhone;
- (void)_readOriginalUrl;
- (void)_readPhone;
- (void)_readUrl;
- (void)addBusinessHours:(id)a3;
- (void)clearBusinessHours;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddress:(id)a3;
- (void)setAmenity:(id)a3;
- (void)setBusinessHours:(id)a3;
- (void)setCategory:(id)a3;
- (void)setContainmentCorrections:(id)a3;
- (void)setFlagBadCuratedCollectionDescription:(BOOL)a3;
- (void)setFlagBrokenCuratedCollectionUrl:(BOOL)a3;
- (void)setFlagHoursIncorrect:(BOOL)a3;
- (void)setFlagNotAtThisAddress:(BOOL)a3;
- (void)setHasFlagBadCuratedCollectionDescription:(BOOL)a3;
- (void)setHasFlagBrokenCuratedCollectionUrl:(BOOL)a3;
- (void)setHasFlagHoursIncorrect:(BOOL)a3;
- (void)setHasFlagNotAtThisAddress:(BOOL)a3;
- (void)setHoursText:(id)a3;
- (void)setName:(id)a3;
- (void)setOriginalName:(id)a3;
- (void)setOriginalPhone:(id)a3;
- (void)setOriginalUrl:(id)a3;
- (void)setPhone:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPoiCorrections

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = (void *)[v6 copy];
        [a1 setName:v7];
      }
      v8 = [v5 objectForKeyedSubscript:@"phone"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (void *)[v8 copy];
        [a1 setPhone:v9];
      }
      v10 = [v5 objectForKeyedSubscript:@"address"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEORPAddressCorrections alloc];
        if (a3) {
          uint64_t v12 = [(GEORPAddressCorrections *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEORPAddressCorrections *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setAddress:v12];
      }
      if (a3) {
        v14 = @"businessHours";
      }
      else {
        v14 = @"business_hours";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        v61 = v15;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v62 objects:v66 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v63 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v62 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v22 = [GEORPFeedbackBusinessHours alloc];
                if (a3) {
                  uint64_t v23 = [(GEORPFeedbackBusinessHours *)v22 initWithJSON:v21];
                }
                else {
                  uint64_t v23 = [(GEORPFeedbackBusinessHours *)v22 initWithDictionary:v21];
                }
                v24 = (void *)v23;
                [a1 addBusinessHours:v23];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v62 objects:v66 count:16];
          }
          while (v18);
        }

        v15 = v61;
      }

      v25 = [v5 objectForKeyedSubscript:@"url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = (void *)[v25 copy];
        [a1 setUrl:v26];
      }
      v27 = [v5 objectForKeyedSubscript:@"category"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = [GEORPCategoryCorrections alloc];
        if (a3) {
          uint64_t v29 = [(GEORPCategoryCorrections *)v28 initWithJSON:v27];
        }
        else {
          uint64_t v29 = [(GEORPCategoryCorrections *)v28 initWithDictionary:v27];
        }
        v30 = (void *)v29;
        [a1 setCategory:v29];
      }
      v31 = [v5 objectForKeyedSubscript:@"amenity"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v32 = [GEORPAmenityCorrections alloc];
        if (a3) {
          uint64_t v33 = [(GEORPAmenityCorrections *)v32 initWithJSON:v31];
        }
        else {
          uint64_t v33 = [(GEORPAmenityCorrections *)v32 initWithDictionary:v31];
        }
        v34 = (void *)v33;
        [a1 setAmenity:v33];
      }
      if (a3) {
        v35 = @"flagHoursIncorrect";
      }
      else {
        v35 = @"flag_hours_incorrect";
      }
      v36 = [v5 objectForKeyedSubscript:v35];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setFlagHoursIncorrect:", objc_msgSend(v36, "BOOLValue"));
      }

      if (a3) {
        v37 = @"flagNotAtThisAddress";
      }
      else {
        v37 = @"flag_not_at_this_address";
      }
      v38 = [v5 objectForKeyedSubscript:v37];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setFlagNotAtThisAddress:", objc_msgSend(v38, "BOOLValue"));
      }

      if (a3) {
        v39 = @"originalName";
      }
      else {
        v39 = @"original_name";
      }
      v40 = [v5 objectForKeyedSubscript:v39];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v41 = (void *)[v40 copy];
        [a1 setOriginalName:v41];
      }
      if (a3) {
        v42 = @"originalPhone";
      }
      else {
        v42 = @"original_phone";
      }
      v43 = [v5 objectForKeyedSubscript:v42];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v44 = (void *)[v43 copy];
        [a1 setOriginalPhone:v44];
      }
      if (a3) {
        v45 = @"originalUrl";
      }
      else {
        v45 = @"original_url";
      }
      v46 = [v5 objectForKeyedSubscript:v45];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v47 = (void *)[v46 copy];
        [a1 setOriginalUrl:v47];
      }
      if (a3) {
        v48 = @"hoursText";
      }
      else {
        v48 = @"hours_text";
      }
      v49 = [v5 objectForKeyedSubscript:v48];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v50 = (void *)[v49 copy];
        [a1 setHoursText:v50];
      }
      if (a3) {
        v51 = @"containmentCorrections";
      }
      else {
        v51 = @"containment_corrections";
      }
      v52 = [v5 objectForKeyedSubscript:v51];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v53 = [GEORPPlaceContainmentCorrections alloc];
        if (a3) {
          uint64_t v54 = [(GEORPPlaceContainmentCorrections *)v53 initWithJSON:v52];
        }
        else {
          uint64_t v54 = [(GEORPPlaceContainmentCorrections *)v53 initWithDictionary:v52];
        }
        v55 = (void *)v54;
        [a1 setContainmentCorrections:v54];
      }
      if (a3) {
        v56 = @"flagBrokenCuratedCollectionUrl";
      }
      else {
        v56 = @"flag_broken_curated_collection_url";
      }
      v57 = [v5 objectForKeyedSubscript:v56];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setFlagBrokenCuratedCollectionUrl:", objc_msgSend(v57, "BOOLValue"));
      }

      if (a3) {
        v58 = @"flagBadCuratedCollectionDescription";
      }
      else {
        v58 = @"flag_bad_curated_collection_description";
      }
      v59 = [v5 objectForKeyedSubscript:v58];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setFlagBadCuratedCollectionDescription:", objc_msgSend(v59, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEORPPoiCorrections)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPPoiCorrections;
  v2 = [(GEORPPoiCorrections *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPoiCorrections)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPPoiCorrections;
  v3 = [(GEORPPoiCorrections *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 137) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_2989);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (NSString)name
{
  -[GEORPPoiCorrections _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20800u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readPhone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 137) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhone_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasPhone
{
  return self->_phone != 0;
}

- (NSString)phone
{
  -[GEORPPoiCorrections _readPhone]((uint64_t)self);
  phone = self->_phone;

  return phone;
}

- (void)setPhone:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x28000u;
  objc_storeStrong((id *)&self->_phone, a3);
}

- (void)_readAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 136) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddress_tags_2990);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasAddress
{
  return self->_address != 0;
}

- (GEORPAddressCorrections)address
{
  -[GEORPPoiCorrections _readAddress]((uint64_t)self);
  address = self->_address;

  return address;
}

- (void)setAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20020u;
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)_readBusinessHours
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 136) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessHours_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)businessHours
{
  -[GEORPPoiCorrections _readBusinessHours]((uint64_t)self);
  businessHours = self->_businessHours;

  return businessHours;
}

- (void)setBusinessHours:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  businessHours = self->_businessHours;
  self->_businessHours = v4;
}

- (void)clearBusinessHours
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  businessHours = self->_businessHours;

  [(NSMutableArray *)businessHours removeAllObjects];
}

- (void)addBusinessHours:(id)a3
{
  id v4 = a3;
  -[GEORPPoiCorrections _readBusinessHours]((uint64_t)self);
  -[GEORPPoiCorrections _addNoFlagsBusinessHours:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (void)_addNoFlagsBusinessHours:(uint64_t)a1
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

- (unint64_t)businessHoursCount
{
  -[GEORPPoiCorrections _readBusinessHours]((uint64_t)self);
  businessHours = self->_businessHours;

  return [(NSMutableArray *)businessHours count];
}

- (id)businessHoursAtIndex:(unint64_t)a3
{
  -[GEORPPoiCorrections _readBusinessHours]((uint64_t)self);
  businessHours = self->_businessHours;

  return (id)[(NSMutableArray *)businessHours objectAtIndex:a3];
}

+ (Class)businessHoursType
{
  return (Class)objc_opt_class();
}

- (void)_readUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 138) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (NSString)url
{
  -[GEORPPoiCorrections _readUrl]((uint64_t)self);
  url = self->_url;

  return url;
}

- (void)setUrl:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x30000u;
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)_readCategory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 137) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategory_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (GEORPCategoryCorrections)category
{
  -[GEORPPoiCorrections _readCategory]((uint64_t)self);
  category = self->_category;

  return category;
}

- (void)setCategory:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20100u;
  objc_storeStrong((id *)&self->_category, a3);
}

- (void)_readAmenity
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 136) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAmenity_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasAmenity
{
  return self->_amenity != 0;
}

- (GEORPAmenityCorrections)amenity
{
  -[GEORPPoiCorrections _readAmenity]((uint64_t)self);
  amenity = self->_amenity;

  return amenity;
}

- (void)setAmenity:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20040u;
  objc_storeStrong((id *)&self->_amenity, a3);
}

- (BOOL)flagHoursIncorrect
{
  return self->_flagHoursIncorrect;
}

- (void)setFlagHoursIncorrect:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20004u;
  self->_flagHoursIncorrect = a3;
}

- (void)setHasFlagHoursIncorrect:(BOOL)a3
{
  if (a3) {
    int v3 = 131076;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($9CF4D21F187FAA92402203F7BE027006)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasFlagHoursIncorrect
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)flagNotAtThisAddress
{
  return self->_flagNotAtThisAddress;
}

- (void)setFlagNotAtThisAddress:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20008u;
  self->_flagNotAtThisAddress = a3;
}

- (void)setHasFlagNotAtThisAddress:(BOOL)a3
{
  if (a3) {
    int v3 = 131080;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($9CF4D21F187FAA92402203F7BE027006)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasFlagNotAtThisAddress
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (void)_readOriginalName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 137) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalName_tags_2992);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasOriginalName
{
  return self->_originalName != 0;
}

- (NSString)originalName
{
  -[GEORPPoiCorrections _readOriginalName]((uint64_t)self);
  originalName = self->_originalName;

  return originalName;
}

- (void)setOriginalName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x21000u;
  objc_storeStrong((id *)&self->_originalName, a3);
}

- (void)_readOriginalPhone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 137) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalPhone_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasOriginalPhone
{
  return self->_originalPhone != 0;
}

- (NSString)originalPhone
{
  -[GEORPPoiCorrections _readOriginalPhone]((uint64_t)self);
  originalPhone = self->_originalPhone;

  return originalPhone;
}

- (void)setOriginalPhone:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x22000u;
  objc_storeStrong((id *)&self->_originalPhone, a3);
}

- (void)_readOriginalUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 137) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalUrl_tags_2993);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasOriginalUrl
{
  return self->_originalUrl != 0;
}

- (NSString)originalUrl
{
  -[GEORPPoiCorrections _readOriginalUrl]((uint64_t)self);
  originalUrl = self->_originalUrl;

  return originalUrl;
}

- (void)setOriginalUrl:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x24000u;
  objc_storeStrong((id *)&self->_originalUrl, a3);
}

- (void)_readHoursText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 137) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHoursText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasHoursText
{
  return self->_hoursText != 0;
}

- (NSString)hoursText
{
  -[GEORPPoiCorrections _readHoursText]((uint64_t)self);
  hoursText = self->_hoursText;

  return hoursText;
}

- (void)setHoursText:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20400u;
  objc_storeStrong((id *)&self->_hoursText, a3);
}

- (void)_readContainmentCorrections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 137) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContainmentCorrections_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasContainmentCorrections
{
  return self->_containmentCorrections != 0;
}

- (GEORPPlaceContainmentCorrections)containmentCorrections
{
  -[GEORPPoiCorrections _readContainmentCorrections]((uint64_t)self);
  containmentCorrections = self->_containmentCorrections;

  return containmentCorrections;
}

- (void)setContainmentCorrections:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20200u;
  objc_storeStrong((id *)&self->_containmentCorrections, a3);
}

- (BOOL)flagBrokenCuratedCollectionUrl
{
  return self->_flagBrokenCuratedCollectionUrl;
}

- (void)setFlagBrokenCuratedCollectionUrl:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20002u;
  self->_flagBrokenCuratedCollectionUrl = a3;
}

- (void)setHasFlagBrokenCuratedCollectionUrl:(BOOL)a3
{
  if (a3) {
    int v3 = 131074;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($9CF4D21F187FAA92402203F7BE027006)(*(_DWORD *)&self->_flags & 0xFFFDFFFD | v3);
}

- (BOOL)hasFlagBrokenCuratedCollectionUrl
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)flagBadCuratedCollectionDescription
{
  return self->_flagBadCuratedCollectionDescription;
}

- (void)setFlagBadCuratedCollectionDescription:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20001u;
  self->_flagBadCuratedCollectionDescription = a3;
}

- (void)setHasFlagBadCuratedCollectionDescription:(BOOL)a3
{
  self->_flags = ($9CF4D21F187FAA92402203F7BE027006)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x20000);
}

- (BOOL)hasFlagBadCuratedCollectionDescription
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPoiCorrections;
  id v4 = [(GEORPPoiCorrections *)&v8 description];
  id v5 = [(GEORPPoiCorrections *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPoiCorrections _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 name];
    if (v5) {
      [v4 setObject:v5 forKey:@"name"];
    }

    objc_super v6 = [(id)a1 phone];
    if (v6) {
      [v4 setObject:v6 forKey:@"phone"];
    }

    id v7 = [(id)a1 address];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"address"];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v11 = *(id *)(a1 + 40);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v57 objects:v61 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v58 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            if (a2) {
              [v16 jsonRepresentation];
            }
            else {
            uint64_t v17 = [v16 dictionaryRepresentation];
            }
            [v10 addObject:v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v57 objects:v61 count:16];
        }
        while (v13);
      }

      if (a2) {
        uint64_t v18 = @"businessHours";
      }
      else {
        uint64_t v18 = @"business_hours";
      }
      [v4 setObject:v10 forKey:v18];
    }
    uint64_t v19 = [(id)a1 url];
    if (v19) {
      [v4 setObject:v19 forKey:@"url"];
    }

    v20 = [(id)a1 category];
    uint64_t v21 = v20;
    if (v20)
    {
      if (a2) {
        [v20 jsonRepresentation];
      }
      else {
      v22 = [v20 dictionaryRepresentation];
      }
      [v4 setObject:v22 forKey:@"category"];
    }
    uint64_t v23 = [(id)a1 amenity];
    v24 = v23;
    if (v23)
    {
      if (a2) {
        [v23 jsonRepresentation];
      }
      else {
      v25 = [v23 dictionaryRepresentation];
      }
      [v4 setObject:v25 forKey:@"amenity"];
    }
    int v26 = *(_DWORD *)(a1 + 136);
    if ((v26 & 4) != 0)
    {
      v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 134)];
      if (a2) {
        v28 = @"flagHoursIncorrect";
      }
      else {
        v28 = @"flag_hours_incorrect";
      }
      [v4 setObject:v27 forKey:v28];

      int v26 = *(_DWORD *)(a1 + 136);
    }
    if ((v26 & 8) != 0)
    {
      uint64_t v29 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 135)];
      if (a2) {
        v30 = @"flagNotAtThisAddress";
      }
      else {
        v30 = @"flag_not_at_this_address";
      }
      [v4 setObject:v29 forKey:v30];
    }
    v31 = [(id)a1 originalName];
    if (v31)
    {
      if (a2) {
        v32 = @"originalName";
      }
      else {
        v32 = @"original_name";
      }
      [v4 setObject:v31 forKey:v32];
    }

    uint64_t v33 = [(id)a1 originalPhone];
    if (v33)
    {
      if (a2) {
        v34 = @"originalPhone";
      }
      else {
        v34 = @"original_phone";
      }
      [v4 setObject:v33 forKey:v34];
    }

    v35 = [(id)a1 originalUrl];
    if (v35)
    {
      if (a2) {
        v36 = @"originalUrl";
      }
      else {
        v36 = @"original_url";
      }
      [v4 setObject:v35 forKey:v36];
    }

    v37 = [(id)a1 hoursText];
    if (v37)
    {
      if (a2) {
        v38 = @"hoursText";
      }
      else {
        v38 = @"hours_text";
      }
      [v4 setObject:v37 forKey:v38];
    }

    v39 = [(id)a1 containmentCorrections];
    v40 = v39;
    if (v39)
    {
      if (a2)
      {
        v41 = [v39 jsonRepresentation];
        v42 = @"containmentCorrections";
      }
      else
      {
        v41 = [v39 dictionaryRepresentation];
        v42 = @"containment_corrections";
      }
      [v4 setObject:v41 forKey:v42];
    }
    int v43 = *(_DWORD *)(a1 + 136);
    if ((v43 & 2) != 0)
    {
      v44 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 133)];
      if (a2) {
        v45 = @"flagBrokenCuratedCollectionUrl";
      }
      else {
        v45 = @"flag_broken_curated_collection_url";
      }
      [v4 setObject:v44 forKey:v45];

      int v43 = *(_DWORD *)(a1 + 136);
    }
    if (v43)
    {
      v46 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 132)];
      if (a2) {
        v47 = @"flagBadCuratedCollectionDescription";
      }
      else {
        v47 = @"flag_bad_curated_collection_description";
      }
      [v4 setObject:v46 forKey:v47];
    }
    v48 = *(void **)(a1 + 16);
    if (v48)
    {
      v49 = [v48 dictionaryRepresentation];
      v50 = v49;
      if (a2)
      {
        v51 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v49, "count"));
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __49__GEORPPoiCorrections__dictionaryRepresentation___block_invoke;
        v55[3] = &unk_1E53D8860;
        id v52 = v51;
        id v56 = v52;
        [v50 enumerateKeysAndObjectsUsingBlock:v55];
        id v53 = v52;

        v50 = v53;
      }
      [v4 setObject:v50 forKey:@"Unknown Fields"];
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
  return -[GEORPPoiCorrections _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEORPPoiCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPPoiCorrections)initWithDictionary:(id)a3
{
  return (GEORPPoiCorrections *)-[GEORPPoiCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEORPPoiCorrections)initWithJSON:(id)a3
{
  return (GEORPPoiCorrections *)-[GEORPPoiCorrections _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3057;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3058;
    }
    GEORPPoiCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPPoiCorrectionsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPoiCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPoiCorrectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPPoiCorrectionsIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPPoiCorrections *)self readAll:0];
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    if (self->_phone) {
      PBDataWriterWriteStringField();
    }
    if (self->_address) {
      PBDataWriterWriteSubmessage();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v6 = self->_businessHours;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    if (self->_url) {
      PBDataWriterWriteStringField();
    }
    if (self->_category) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_amenity) {
      PBDataWriterWriteSubmessage();
    }
    $9CF4D21F187FAA92402203F7BE027006 flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      $9CF4D21F187FAA92402203F7BE027006 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 8) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_originalName) {
      PBDataWriterWriteStringField();
    }
    if (self->_originalPhone) {
      PBDataWriterWriteStringField();
    }
    if (self->_originalUrl) {
      PBDataWriterWriteStringField();
    }
    if (self->_hoursText) {
      PBDataWriterWriteStringField();
    }
    if (self->_containmentCorrections) {
      PBDataWriterWriteSubmessage();
    }
    $9CF4D21F187FAA92402203F7BE027006 v11 = self->_flags;
    if ((*(unsigned char *)&v11 & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      $9CF4D21F187FAA92402203F7BE027006 v11 = self->_flags;
    }
    if (*(unsigned char *)&v11) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPPoiCorrections _readAddress]((uint64_t)self);
  address = self->_address;

  return [(GEORPAddressCorrections *)address hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  $9CF4D21F187FAA92402203F7BE027006 v11 = (id *)a3;
  [(GEORPPoiCorrections *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 30) = self->_readerMarkPos;
  *((_DWORD *)v11 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_name) {
    objc_msgSend(v11, "setName:");
  }
  if (self->_phone) {
    objc_msgSend(v11, "setPhone:");
  }
  if (self->_address) {
    objc_msgSend(v11, "setAddress:");
  }
  if ([(GEORPPoiCorrections *)self businessHoursCount])
  {
    [v11 clearBusinessHours];
    unint64_t v4 = [(GEORPPoiCorrections *)self businessHoursCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPPoiCorrections *)self businessHoursAtIndex:i];
        [v11 addBusinessHours:v7];
      }
    }
  }
  if (self->_url) {
    objc_msgSend(v11, "setUrl:");
  }
  uint64_t v8 = v11;
  if (self->_category)
  {
    objc_msgSend(v11, "setCategory:");
    uint64_t v8 = v11;
  }
  if (self->_amenity)
  {
    objc_msgSend(v11, "setAmenity:");
    uint64_t v8 = v11;
  }
  $9CF4D21F187FAA92402203F7BE027006 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    *((unsigned char *)v8 + 134) = self->_flagHoursIncorrect;
    *((_DWORD *)v8 + 34) |= 4u;
    $9CF4D21F187FAA92402203F7BE027006 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *((unsigned char *)v8 + 135) = self->_flagNotAtThisAddress;
    *((_DWORD *)v8 + 34) |= 8u;
  }
  if (self->_originalName)
  {
    objc_msgSend(v11, "setOriginalName:");
    uint64_t v8 = v11;
  }
  if (self->_originalPhone)
  {
    objc_msgSend(v11, "setOriginalPhone:");
    uint64_t v8 = v11;
  }
  if (self->_originalUrl)
  {
    objc_msgSend(v11, "setOriginalUrl:");
    uint64_t v8 = v11;
  }
  if (self->_hoursText)
  {
    objc_msgSend(v11, "setHoursText:");
    uint64_t v8 = v11;
  }
  if (self->_containmentCorrections)
  {
    objc_msgSend(v11, "setContainmentCorrections:");
    uint64_t v8 = v11;
  }
  $9CF4D21F187FAA92402203F7BE027006 v10 = self->_flags;
  if ((*(unsigned char *)&v10 & 2) != 0)
  {
    *((unsigned char *)v8 + 133) = self->_flagBrokenCuratedCollectionUrl;
    *((_DWORD *)v8 + 34) |= 2u;
    $9CF4D21F187FAA92402203F7BE027006 v10 = self->_flags;
  }
  if (*(unsigned char *)&v10)
  {
    *((unsigned char *)v8 + 132) = self->_flagBadCuratedCollectionDescription;
    *((_DWORD *)v8 + 34) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 2) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPPoiCorrectionsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPPoiCorrections *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  $9CF4D21F187FAA92402203F7BE027006 v10 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v9;

  uint64_t v11 = [(NSString *)self->_phone copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v11;

  id v13 = [(GEORPAddressCorrections *)self->_address copyWithZone:a3];
  long long v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v15 = self->_businessHours;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "copyWithZone:", a3, (void)v40);
        [(id)v5 addBusinessHours:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSString *)self->_url copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v20;

  id v22 = [(GEORPCategoryCorrections *)self->_category copyWithZone:a3];
  uint64_t v23 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v22;

  id v24 = [(GEORPAmenityCorrections *)self->_amenity copyWithZone:a3];
  v25 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v24;

  $9CF4D21F187FAA92402203F7BE027006 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 134) = self->_flagHoursIncorrect;
    *(_DWORD *)(v5 + 136) |= 4u;
    $9CF4D21F187FAA92402203F7BE027006 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *(unsigned char *)(v5 + 135) = self->_flagNotAtThisAddress;
    *(_DWORD *)(v5 + 136) |= 8u;
  }
  uint64_t v27 = -[NSString copyWithZone:](self->_originalName, "copyWithZone:", a3, (void)v40);
  v28 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v27;

  uint64_t v29 = [(NSString *)self->_originalPhone copyWithZone:a3];
  v30 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v29;

  uint64_t v31 = [(NSString *)self->_originalUrl copyWithZone:a3];
  v32 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v31;

  uint64_t v33 = [(NSString *)self->_hoursText copyWithZone:a3];
  v34 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v33;

  id v35 = [(GEORPPlaceContainmentCorrections *)self->_containmentCorrections copyWithZone:a3];
  v36 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v35;

  $9CF4D21F187FAA92402203F7BE027006 v37 = self->_flags;
  if ((*(unsigned char *)&v37 & 2) != 0)
  {
    *(unsigned char *)(v5 + 133) = self->_flagBrokenCuratedCollectionUrl;
    *(_DWORD *)(v5 + 136) |= 2u;
    $9CF4D21F187FAA92402203F7BE027006 v37 = self->_flags;
  }
  if (*(unsigned char *)&v37)
  {
    *(unsigned char *)(v5 + 132) = self->_flagBadCuratedCollectionDescription;
    *(_DWORD *)(v5 + 136) |= 1u;
  }
  v38 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v38;
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  [(GEORPPoiCorrections *)self readAll:1];
  [v4 readAll:1];
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_52;
    }
  }
  phone = self->_phone;
  if ((unint64_t)phone | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](phone, "isEqual:")) {
      goto LABEL_52;
    }
  }
  address = self->_address;
  if ((unint64_t)address | *((void *)v4 + 3))
  {
    if (!-[GEORPAddressCorrections isEqual:](address, "isEqual:")) {
      goto LABEL_52;
    }
  }
  businessHours = self->_businessHours;
  if ((unint64_t)businessHours | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](businessHours, "isEqual:")) {
      goto LABEL_52;
    }
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_52;
    }
  }
  category = self->_category;
  if ((unint64_t)category | *((void *)v4 + 6))
  {
    if (!-[GEORPCategoryCorrections isEqual:](category, "isEqual:")) {
      goto LABEL_52;
    }
  }
  amenity = self->_amenity;
  if ((unint64_t)amenity | *((void *)v4 + 4))
  {
    if (!-[GEORPAmenityCorrections isEqual:](amenity, "isEqual:")) {
      goto LABEL_52;
    }
  }
  $9CF4D21F187FAA92402203F7BE027006 flags = self->_flags;
  int v13 = *((_DWORD *)v4 + 34);
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v13 & 4) == 0) {
      goto LABEL_52;
    }
    if (self->_flagHoursIncorrect)
    {
      if (!*((unsigned char *)v4 + 134)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 134))
    {
      goto LABEL_52;
    }
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v13 & 8) == 0) {
      goto LABEL_52;
    }
    if (self->_flagNotAtThisAddress)
    {
      if (!*((unsigned char *)v4 + 135)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 135))
    {
      goto LABEL_52;
    }
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_52;
  }
  originalName = self->_originalName;
  if ((unint64_t)originalName | *((void *)v4 + 10)
    && !-[NSString isEqual:](originalName, "isEqual:"))
  {
    goto LABEL_52;
  }
  originalPhone = self->_originalPhone;
  if ((unint64_t)originalPhone | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](originalPhone, "isEqual:")) {
      goto LABEL_52;
    }
  }
  originalUrl = self->_originalUrl;
  if ((unint64_t)originalUrl | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](originalUrl, "isEqual:")) {
      goto LABEL_52;
    }
  }
  hoursText = self->_hoursText;
  if ((unint64_t)hoursText | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](hoursText, "isEqual:")) {
      goto LABEL_52;
    }
  }
  containmentCorrections = self->_containmentCorrections;
  if ((unint64_t)containmentCorrections | *((void *)v4 + 7))
  {
    if (!-[GEORPPlaceContainmentCorrections isEqual:](containmentCorrections, "isEqual:")) {
      goto LABEL_52;
    }
  }
  $9CF4D21F187FAA92402203F7BE027006 v19 = self->_flags;
  int v20 = *((_DWORD *)v4 + 34);
  if ((*(unsigned char *)&v19 & 2) != 0)
  {
    if ((v20 & 2) == 0) {
      goto LABEL_52;
    }
    if (self->_flagBrokenCuratedCollectionUrl)
    {
      if (!*((unsigned char *)v4 + 133)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 133))
    {
      goto LABEL_52;
    }
  }
  else if ((v20 & 2) != 0)
  {
    goto LABEL_52;
  }
  BOOL v21 = (*((_DWORD *)v4 + 34) & 1) == 0;
  if (*(unsigned char *)&v19)
  {
    if (v20)
    {
      if (self->_flagBadCuratedCollectionDescription)
      {
        if (!*((unsigned char *)v4 + 132)) {
          goto LABEL_52;
        }
      }
      else if (*((unsigned char *)v4 + 132))
      {
        goto LABEL_52;
      }
      BOOL v21 = 1;
      goto LABEL_53;
    }
LABEL_52:
    BOOL v21 = 0;
  }
LABEL_53:

  return v21;
}

- (unint64_t)hash
{
  [(GEORPPoiCorrections *)self readAll:1];
  NSUInteger v21 = [(NSString *)self->_name hash];
  NSUInteger v20 = [(NSString *)self->_phone hash];
  unint64_t v19 = [(GEORPAddressCorrections *)self->_address hash];
  uint64_t v18 = [(NSMutableArray *)self->_businessHours hash];
  NSUInteger v17 = [(NSString *)self->_url hash];
  unint64_t v16 = [(GEORPCategoryCorrections *)self->_category hash];
  unint64_t v3 = [(GEORPAmenityCorrections *)self->_amenity hash];
  $9CF4D21F187FAA92402203F7BE027006 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_flagHoursIncorrect;
    if ((*(unsigned char *)&flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&flags & 8) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_flagNotAtThisAddress;
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  NSUInteger v7 = [(NSString *)self->_originalName hash];
  NSUInteger v8 = [(NSString *)self->_originalPhone hash];
  NSUInteger v9 = [(NSString *)self->_originalUrl hash];
  NSUInteger v10 = [(NSString *)self->_hoursText hash];
  unint64_t v11 = [(GEORPPlaceContainmentCorrections *)self->_containmentCorrections hash];
  $9CF4D21F187FAA92402203F7BE027006 v12 = self->_flags;
  if ((*(unsigned char *)&v12 & 2) != 0)
  {
    uint64_t v13 = 2654435761 * self->_flagBrokenCuratedCollectionUrl;
    if (*(unsigned char *)&v12) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v14 = 0;
    return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
  }
  uint64_t v13 = 0;
  if ((*(unsigned char *)&v12 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v14 = 2654435761 * self->_flagBadCuratedCollectionDescription;
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 9)) {
    -[GEORPPoiCorrections setName:](self, "setName:");
  }
  if (*((void *)v4 + 13)) {
    -[GEORPPoiCorrections setPhone:](self, "setPhone:");
  }
  address = self->_address;
  uint64_t v6 = *((void *)v4 + 3);
  if (address)
  {
    if (v6) {
      -[GEORPAddressCorrections mergeFrom:](address, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPPoiCorrections setAddress:](self, "setAddress:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = *((id *)v4 + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEORPPoiCorrections addBusinessHours:](self, "addBusinessHours:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 14)) {
    -[GEORPPoiCorrections setUrl:](self, "setUrl:");
  }
  category = self->_category;
  uint64_t v13 = *((void *)v4 + 6);
  if (category)
  {
    if (v13) {
      -[GEORPCategoryCorrections mergeFrom:](category, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORPPoiCorrections setCategory:](self, "setCategory:");
  }
  amenity = self->_amenity;
  uint64_t v15 = *((void *)v4 + 4);
  if (amenity)
  {
    if (v15) {
      -[GEORPAmenityCorrections mergeFrom:](amenity, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEORPPoiCorrections setAmenity:](self, "setAmenity:");
  }
  int v16 = *((_DWORD *)v4 + 34);
  if ((v16 & 4) != 0)
  {
    self->_flagHoursIncorrect = *((unsigned char *)v4 + 134);
    *(_DWORD *)&self->_flags |= 4u;
    int v16 = *((_DWORD *)v4 + 34);
  }
  if ((v16 & 8) != 0)
  {
    self->_flagNotAtThisAddress = *((unsigned char *)v4 + 135);
    *(_DWORD *)&self->_flags |= 8u;
  }
  if (*((void *)v4 + 10)) {
    -[GEORPPoiCorrections setOriginalName:](self, "setOriginalName:");
  }
  if (*((void *)v4 + 11)) {
    -[GEORPPoiCorrections setOriginalPhone:](self, "setOriginalPhone:");
  }
  if (*((void *)v4 + 12)) {
    -[GEORPPoiCorrections setOriginalUrl:](self, "setOriginalUrl:");
  }
  if (*((void *)v4 + 8)) {
    -[GEORPPoiCorrections setHoursText:](self, "setHoursText:");
  }
  containmentCorrections = self->_containmentCorrections;
  uint64_t v18 = *((void *)v4 + 7);
  if (containmentCorrections)
  {
    if (v18) {
      -[GEORPPlaceContainmentCorrections mergeFrom:](containmentCorrections, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[GEORPPoiCorrections setContainmentCorrections:](self, "setContainmentCorrections:");
  }
  int v19 = *((_DWORD *)v4 + 34);
  if ((v19 & 2) != 0)
  {
    self->_flagBrokenCuratedCollectionUrl = *((unsigned char *)v4 + 133);
    *(_DWORD *)&self->_flags |= 2u;
    int v19 = *((_DWORD *)v4 + 34);
  }
  if (v19)
  {
    self->_flagBadCuratedCollectionDescription = *((unsigned char *)v4 + 132);
    *(_DWORD *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPPoiCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3062);
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
  *(_DWORD *)&self->_flags |= 0x20010u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPPoiCorrections *)self readAll:0];
    [(GEORPAddressCorrections *)self->_address clearUnknownFields:1];
    [(GEORPCategoryCorrections *)self->_category clearUnknownFields:1];
    containmentCorrections = self->_containmentCorrections;
    [(GEORPPlaceContainmentCorrections *)containmentCorrections clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_phone, 0);
  objc_storeStrong((id *)&self->_originalUrl, 0);
  objc_storeStrong((id *)&self->_originalPhone, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_hoursText, 0);
  objc_storeStrong((id *)&self->_containmentCorrections, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_amenity, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end