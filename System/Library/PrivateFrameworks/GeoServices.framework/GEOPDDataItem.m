@interface GEOPDDataItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDDataItem)init;
- (GEOPDDataItem)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)businessHoursData;
- (id)categoryData;
- (id)categoryName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)factoidData;
- (id)jsonRepresentation;
- (id)locationData;
- (id)locationName;
- (id)ratingData;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (uint64_t)type;
- (unint64_t)hash;
- (void)_readBusinessHoursData;
- (void)_readCategoryData;
- (void)_readFactoidData;
- (void)_readLocationData;
- (void)_readRatingData;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDDataItem

- (id)categoryName
{
  -[GEOPDDataItem categoryData]((id *)&self->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = -[GEOPDCategoryData categoryNames](v2);
  v4 = +[GEOLocalizedString bestStringForCurrentLocale:v3 fallbackToFirstAvailable:1];

  return v4;
}

- (id)locationName
{
  -[GEOPDDataItem locationData]((id *)&self->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = -[GEOPDLocationData locationNames](v2);
  v4 = +[GEOLocalizedString bestStringForCurrentLocale:v3 fallbackToFirstAvailable:1];

  return v4;
}

- (GEOPDDataItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDDataItem;
  v2 = [(GEOPDDataItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDDataItem)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDDataItem;
  v3 = [(GEOPDDataItem *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)type
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 80);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if (v2) {
      return *(unsigned int *)(v1 + 76);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readRatingData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x40) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDataItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRatingData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)ratingData
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDDataItem _readRatingData]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readCategoryData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDataItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)categoryData
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDDataItem _readCategoryData]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readFactoidData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDataItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFactoidData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)factoidData
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDDataItem _readFactoidData]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readBusinessHoursData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDataItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessHoursData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)businessHoursData
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDDataItem _readBusinessHoursData]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readLocationData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDataItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)locationData
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDDataItem _readLocationData]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDDataItem;
  v4 = [(GEOPDDataItem *)&v8 description];
  v5 = [(GEOPDDataItem *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDataItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDDataItem readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v5 = *(int *)(a1 + 76);
      if (v5 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E3800[v5];
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    objc_super v7 = -[GEOPDDataItem ratingData]((id *)a1);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"ratingData";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"rating_data";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = -[GEOPDDataItem categoryData]((id *)a1);
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"categoryData";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"category_data";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = -[GEOPDDataItem factoidData]((id *)a1);
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"factoidData";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"factoid_data";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = -[GEOPDDataItem businessHoursData]((id *)a1);
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"businessHoursData";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"business_hours_data";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = -[GEOPDDataItem locationData]((id *)a1);
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"locationData";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"location_data";
      }
      [v4 setObject:v25 forKey:v26];
    }
    v27 = *(void **)(a1 + 16);
    if (v27)
    {
      v28 = [v27 dictionaryRepresentation];
      v29 = v28;
      if (a2)
      {
        v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __43__GEOPDDataItem__dictionaryRepresentation___block_invoke;
        v34[3] = &unk_1E53D8860;
        id v31 = v30;
        id v35 = v31;
        [v29 enumerateKeysAndObjectsUsingBlock:v34];
        id v32 = v31;

        v29 = v32;
      }
      [v4 setObject:v29 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDDataItem _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_3626;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_3627;
      }
      GEOPDDataItemReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDRatingData readAll:](*(void *)(a1 + 56), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __43__GEOPDDataItem__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_133;
  }
  objc_super v7 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"ITEM_TYPE_UNKNOWN"])
    {
      int v9 = 0;
    }
    else if ([v8 isEqualToString:@"ITEM_TYPE_RATING"])
    {
      int v9 = 1;
    }
    else if ([v8 isEqualToString:@"ITEM_TYPE_CATEGORY"])
    {
      int v9 = 2;
    }
    else if ([v8 isEqualToString:@"ITEM_TYPE_FACTOID"])
    {
      int v9 = 3;
    }
    else if ([v8 isEqualToString:@"ITEM_TYPE_BUSINESS_HOURS"])
    {
      int v9 = 4;
    }
    else if ([v8 isEqualToString:@"ITEM_TYPE_LOCATION"])
    {
      int v9 = 5;
    }
    else if ([v8 isEqualToString:@"ITEM_TYPE_HIKES"])
    {
      int v9 = 6;
    }
    else
    {
      int v9 = 0;
    }

    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v9 = [v7 intValue];
LABEL_21:
    *(unsigned char *)(v6 + 80) |= 0x80u;
    *(unsigned char *)(v6 + 80) |= 1u;
    *(_DWORD *)(v6 + 76) = v9;
  }

  if (a3) {
    id v10 = @"ratingData";
  }
  else {
    id v10 = @"rating_data";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [GEOPDRatingData alloc];
    if (v12)
    {
      id v13 = v11;
      v12 = [(GEOPDRatingData *)v12 init];
      if (v12)
      {
        v14 = [v13 objectForKeyedSubscript:@"rating"];
        objc_opt_class();
        id v84 = v13;
        if (objc_opt_isKindOfClass())
        {
          v81 = v14;
          id v83 = v11;
          id v87 = v5;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v90 objects:v94 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v91;
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v91 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = *(void **)(*((void *)&v90 + 1) + 8 * v19);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v21 = [GEOPDRating alloc];
                  if (v21) {
                    v22 = (void *)-[GEOPDRating _initWithDictionary:isJSON:](v21, v20, a3);
                  }
                  else {
                    v22 = 0;
                  }
                  -[GEOPDRatingData addRating:]((uint64_t)v12, v22);
                }
                ++v19;
              }
              while (v17 != v19);
              uint64_t v23 = [v15 countByEnumeratingWithState:&v90 objects:v94 count:16];
              uint64_t v17 = v23;
            }
            while (v23);
          }

          id v13 = v84;
          id v5 = v87;
          v11 = v83;
        }

        if (a3) {
          v24 = @"vendorId";
        }
        else {
          v24 = @"vendor_id";
        }
        v25 = objc_msgSend(v13, "objectForKeyedSubscript:", v24, v81, v83);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v26 = (void *)[v25 copy];
          id v27 = v26;
          *(unsigned char *)&v12->_flags |= 4u;
          *(unsigned char *)&v12->_flags |= 8u;
          id v13 = v84;
          objc_storeStrong((id *)&v12->_vendorId, v26);
        }
      }
    }
    v28 = v12;
    *(unsigned char *)(v6 + 80) |= 0x40u;
    *(unsigned char *)(v6 + 80) |= 0x80u;
    objc_storeStrong((id *)(v6 + 56), v12);
  }
  if (a3) {
    v29 = @"categoryData";
  }
  else {
    v29 = @"category_data";
  }
  v30 = [v5 objectForKeyedSubscript:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = [GEOPDCategoryData alloc];
    if (v31)
    {
      id v32 = v30;
      id v31 = [(GEOPDCategoryData *)v31 init];
      if (v31)
      {
        if (a3) {
          v33 = @"categoryName";
        }
        else {
          v33 = @"category_name";
        }
        v34 = [v32 objectForKeyedSubscript:v33];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v83 = v32;
          v85 = v30;
          id v88 = v5;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          v81 = v34;
          id v35 = v34;
          uint64_t v36 = [v35 countByEnumeratingWithState:&v90 objects:v94 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v91;
            do
            {
              for (uint64_t i = 0; i != v37; ++i)
              {
                if (*(void *)v91 != v38) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v40 = *(void *)(*((void *)&v90 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v41 = [GEOLocalizedString alloc];
                  if (a3) {
                    v42 = [(GEOLocalizedString *)v41 initWithJSON:v40];
                  }
                  else {
                    v42 = [(GEOLocalizedString *)v41 initWithDictionary:v40];
                  }
                  v43 = v42;
                  -[GEOPDCategoryData addCategoryName:]((uint64_t)v31, v42);
                }
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v90 objects:v94 count:16];
            }
            while (v37);
          }

          v30 = v85;
          id v5 = v88;
          v34 = v81;
        }
      }
    }
    v44 = v31;
    *(unsigned char *)(v6 + 80) |= 8u;
    *(unsigned char *)(v6 + 80) |= 0x80u;
    objc_storeStrong((id *)(v6 + 32), v31);
  }
  if (a3) {
    v45 = @"factoidData";
  }
  else {
    v45 = @"factoid_data";
  }
  v46 = objc_msgSend(v5, "objectForKeyedSubscript:", v45, v81, v83);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v47 = [GEOPDFactoidData alloc];
    if (v47)
    {
      id v48 = v46;
      v47 = [(GEOPDFactoidData *)v47 init];
      if (v47)
      {
        v49 = [v48 objectForKeyedSubscript:@"factoid"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v50 = [GEOPDFactoid alloc];
          if (v50) {
            v51 = (void *)-[GEOPDFactoid _initWithDictionary:isJSON:](v50, v49, a3);
          }
          else {
            v51 = 0;
          }
          id v52 = v51;
          objc_storeStrong((id *)&v47->_factoid, v51);
        }
      }
    }
    v53 = v47;
    *(unsigned char *)(v6 + 80) |= 0x10u;
    *(unsigned char *)(v6 + 80) |= 0x80u;
    objc_storeStrong((id *)(v6 + 40), v47);
  }
  if (a3) {
    v54 = @"businessHoursData";
  }
  else {
    v54 = @"business_hours_data";
  }
  v55 = [v5 objectForKeyedSubscript:v54];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v56 = [GEOPDBusinessHoursData alloc];
    if (v56)
    {
      id v57 = v55;
      v56 = [(GEOPDBusinessHoursData *)v56 init];
      if (v56)
      {
        if (a3) {
          v58 = @"businessHours";
        }
        else {
          v58 = @"business_hours";
        }
        v59 = [v57 objectForKeyedSubscript:v58];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v60 = [GEOPDBusinessHours alloc];
          if (v60) {
            v61 = (void *)-[GEOPDBusinessHours _initWithDictionary:isJSON:](v60, v59, a3);
          }
          else {
            v61 = 0;
          }
          id v62 = v61;
          objc_storeStrong((id *)&v56->_businessHours, v61);
        }
      }
    }
    v63 = v56;
    *(unsigned char *)(v6 + 80) |= 4u;
    *(unsigned char *)(v6 + 80) |= 0x80u;
    objc_storeStrong((id *)(v6 + 24), v56);
  }
  if (a3) {
    v64 = @"locationData";
  }
  else {
    v64 = @"location_data";
  }
  v65 = [v5 objectForKeyedSubscript:v64];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v66 = [GEOPDLocationData alloc];
    if (v66)
    {
      id v67 = v65;
      v66 = [(GEOPDLocationData *)v66 init];
      if (v66)
      {
        if (a3) {
          v68 = @"locationName";
        }
        else {
          v68 = @"location_name";
        }
        v69 = [v67 objectForKeyedSubscript:v68];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v86 = v65;
          id v89 = v5;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          v82 = v69;
          id v70 = v69;
          uint64_t v71 = [v70 countByEnumeratingWithState:&v90 objects:v94 count:16];
          if (v71)
          {
            uint64_t v72 = v71;
            uint64_t v73 = *(void *)v91;
            do
            {
              for (uint64_t j = 0; j != v72; ++j)
              {
                if (*(void *)v91 != v73) {
                  objc_enumerationMutation(v70);
                }
                uint64_t v75 = *(void *)(*((void *)&v90 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v76 = [GEOLocalizedString alloc];
                  if (a3) {
                    v77 = [(GEOLocalizedString *)v76 initWithJSON:v75];
                  }
                  else {
                    v77 = [(GEOLocalizedString *)v76 initWithDictionary:v75];
                  }
                  v78 = v77;
                  -[GEOPDLocationData addLocationName:]((uint64_t)v66, v77);
                }
              }
              uint64_t v72 = [v70 countByEnumeratingWithState:&v90 objects:v94 count:16];
            }
            while (v72);
          }

          v65 = v86;
          id v5 = v89;
          v69 = v82;
        }
      }
    }
    v79 = v66;
    *(unsigned char *)(v6 + 80) |= 0x20u;
    *(unsigned char *)(v6 + 80) |= 0x80u;
    objc_storeStrong((id *)(v6 + 48), v66);
  }
LABEL_133:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDataItemReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDDataItemIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDDataItem readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_ratingData)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_categoryData)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_factoidData)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_businessHoursData)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_locationData)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDDataItem _readFactoidData](result);
    uint64_t v4 = *(void *)(v3 + 40);
    result = 0;
    if (v4)
    {
      uint64_t v5 = *(void *)(v4 + 16);
      if (v5)
      {
        -[GEOPDFactoid _readPlaceId](*(void *)(v4 + 16));
        if ([*(id *)(v5 + 48) hasGreenTeaWithValue:a2]) {
          return 1;
        }
      }
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDDataItemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDDataItem readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 76) = self->_type;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  id v9 = [(GEOPDRatingData *)self->_ratingData copyWithZone:a3];
  id v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  id v11 = [(GEOPDCategoryData *)self->_categoryData copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  id v13 = [(GEOPDFactoidData *)self->_factoidData copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  id v15 = [(GEOPDBusinessHoursData *)self->_businessHoursData copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v15;

  id v17 = [(GEOPDLocationData *)self->_locationData copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v17;

  uint64_t v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  -[GEOPDDataItem readAll:]((uint64_t)self, 1);
  -[GEOPDDataItem readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_type != *((_DWORD *)v4 + 19)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  ratingData = self->_ratingData;
  if ((unint64_t)ratingData | *((void *)v4 + 7) && !-[GEOPDRatingData isEqual:](ratingData, "isEqual:")) {
    goto LABEL_17;
  }
  categoryData = self->_categoryData;
  if ((unint64_t)categoryData | *((void *)v4 + 4))
  {
    if (!-[GEOPDCategoryData isEqual:](categoryData, "isEqual:")) {
      goto LABEL_17;
    }
  }
  factoidData = self->_factoidData;
  if ((unint64_t)factoidData | *((void *)v4 + 5))
  {
    if (!-[GEOPDFactoidData isEqual:](factoidData, "isEqual:")) {
      goto LABEL_17;
    }
  }
  businessHoursData = self->_businessHoursData;
  if ((unint64_t)businessHoursData | *((void *)v4 + 3))
  {
    if (!-[GEOPDBusinessHoursData isEqual:](businessHoursData, "isEqual:")) {
      goto LABEL_17;
    }
  }
  locationData = self->_locationData;
  if ((unint64_t)locationData | *((void *)v4 + 6)) {
    char v10 = -[GEOPDLocationData isEqual:](locationData, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  -[GEOPDDataItem readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDRatingData *)self->_ratingData hash] ^ v3;
  unint64_t v5 = [(GEOPDCategoryData *)self->_categoryData hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOPDFactoidData *)self->_factoidData hash];
  unint64_t v7 = [(GEOPDBusinessHoursData *)self->_businessHoursData hash];
  return v6 ^ v7 ^ [(GEOPDLocationData *)self->_locationData hash];
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 80) |= 2u;
    *(unsigned char *)(a1 + 80) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    char v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDDataItem readAll:](a1, 0);
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v3 + 52) |= 1u;
      *(unsigned char *)(v3 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 48));
      unint64_t v4 = *(void **)(v3 + 16);
      *(void *)(v3 + 16) = 0;

      -[GEOPDRatingData readAll:](v3, 0);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v5 = *(id *)(v3 + 24);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v29;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(v5);
            }
            -[GEOPDRating clearUnknownFields:](*(void *)(*((void *)&v28 + 1) + 8 * v9++));
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v7);
      }
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      id v11 = *(void **)(v10 + 8);
      *(void *)(v10 + 8) = 0;

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v12 = *(id *)(v10 + 16);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v29;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v29 != v15) {
              objc_enumerationMutation(v12);
            }
            [*(id *)(*((void *)&v28 + 1) + 8 * v16++) clearUnknownFields:1];
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v14);
      }
    }
    uint64_t v17 = *(void *)(a1 + 40);
    if (v17)
    {
      uint64_t v18 = *(void **)(v17 + 8);
      *(void *)(v17 + 8) = 0;

      -[GEOPDFactoid clearUnknownFields:](*(void *)(v17 + 16));
    }
    uint64_t v19 = *(void *)(a1 + 24);
    if (v19)
    {
      v20 = *(void **)(v19 + 8);
      *(void *)(v19 + 8) = 0;

      -[GEOPDBusinessHours clearUnknownFields:](*(void *)(v19 + 16));
    }
    uint64_t v21 = *(void *)(a1 + 48);
    if (v21)
    {
      v22 = *(void **)(v21 + 8);
      *(void *)(v21 + 8) = 0;

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v23 = *(id *)(v21 + 16);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v29;
        do
        {
          uint64_t v27 = 0;
          do
          {
            if (*(void *)v29 != v26) {
              objc_enumerationMutation(v23);
            }
            [*(id *)(*((void *)&v28 + 1) + 8 * v27++) clearUnknownFields:1];
          }
          while (v25 != v27);
          uint64_t v25 = [v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v25);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingData, 0);
  objc_storeStrong((id *)&self->_locationData, 0);
  objc_storeStrong((id *)&self->_factoidData, 0);
  objc_storeStrong((id *)&self->_categoryData, 0);
  objc_storeStrong((id *)&self->_businessHoursData, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end