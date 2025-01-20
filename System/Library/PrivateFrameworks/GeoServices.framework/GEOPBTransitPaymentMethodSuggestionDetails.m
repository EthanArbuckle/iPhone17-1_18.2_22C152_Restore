@interface GEOPBTransitPaymentMethodSuggestionDetails
+ (BOOL)isValid:(id)a3;
+ (Class)educationalScreenAssetType;
+ (Class)educationalScreenPaymentBodyType;
- (BOOL)hasEducationalScreenHeader;
- (BOOL)hasPaymentMethodRegionMuid;
- (BOOL)hasSuggestionBody;
- (BOOL)hasSuggestionTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)educationalScreenHeader;
- (GEOFormattedString)suggestionBody;
- (GEOFormattedString)suggestionTitle;
- (GEOPBTransitPaymentMethodSuggestionDetails)init;
- (GEOPBTransitPaymentMethodSuggestionDetails)initWithData:(id)a3;
- (GEOPBTransitPaymentMethodSuggestionDetails)initWithDictionary:(id)a3;
- (GEOPBTransitPaymentMethodSuggestionDetails)initWithJSON:(id)a3;
- (NSMutableArray)educationalScreenAssets;
- (NSMutableArray)educationalScreenPaymentBodys;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)educationalScreenAssetAtIndex:(unint64_t)a3;
- (id)educationalScreenPaymentBodyAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)educationalScreenAssetsCount;
- (unint64_t)educationalScreenPaymentBodysCount;
- (unint64_t)hash;
- (unint64_t)paymentMethodRegionMuid;
- (void)_addNoFlagsEducationalScreenAsset:(uint64_t)a1;
- (void)_addNoFlagsEducationalScreenPaymentBody:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readEducationalScreenAssets;
- (void)_readEducationalScreenHeader;
- (void)_readEducationalScreenPaymentBodys;
- (void)_readSuggestionBody;
- (void)_readSuggestionTitle;
- (void)addEducationalScreenAsset:(id)a3;
- (void)addEducationalScreenPaymentBody:(id)a3;
- (void)clearEducationalScreenAssets;
- (void)clearEducationalScreenPaymentBodys;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEducationalScreenAssets:(id)a3;
- (void)setEducationalScreenHeader:(id)a3;
- (void)setEducationalScreenPaymentBodys:(id)a3;
- (void)setHasPaymentMethodRegionMuid:(BOOL)a3;
- (void)setPaymentMethodRegionMuid:(unint64_t)a3;
- (void)setSuggestionBody:(id)a3;
- (void)setSuggestionTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitPaymentMethodSuggestionDetails

- (GEOPBTransitPaymentMethodSuggestionDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitPaymentMethodSuggestionDetails;
  v2 = [(GEOPBTransitPaymentMethodSuggestionDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitPaymentMethodSuggestionDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitPaymentMethodSuggestionDetails;
  v3 = [(GEOPBTransitPaymentMethodSuggestionDetails *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)paymentMethodRegionMuid
{
  return self->_paymentMethodRegionMuid;
}

- (void)setPaymentMethodRegionMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_paymentMethodRegionMuid = a3;
}

- (void)setHasPaymentMethodRegionMuid:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasPaymentMethodRegionMuid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readEducationalScreenHeader
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodSuggestionDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEducationalScreenHeader_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasEducationalScreenHeader
{
  return self->_educationalScreenHeader != 0;
}

- (GEOFormattedString)educationalScreenHeader
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenHeader]((uint64_t)self);
  educationalScreenHeader = self->_educationalScreenHeader;

  return educationalScreenHeader;
}

- (void)setEducationalScreenHeader:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_educationalScreenHeader, a3);
}

- (void)_readEducationalScreenPaymentBodys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodSuggestionDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEducationalScreenPaymentBodys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)educationalScreenPaymentBodys
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenPaymentBodys]((uint64_t)self);
  educationalScreenPaymentBodys = self->_educationalScreenPaymentBodys;

  return educationalScreenPaymentBodys;
}

- (void)setEducationalScreenPaymentBodys:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  educationalScreenPaymentBodys = self->_educationalScreenPaymentBodys;
  self->_educationalScreenPaymentBodys = v4;
}

- (void)clearEducationalScreenPaymentBodys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  educationalScreenPaymentBodys = self->_educationalScreenPaymentBodys;

  [(NSMutableArray *)educationalScreenPaymentBodys removeAllObjects];
}

- (void)addEducationalScreenPaymentBody:(id)a3
{
  id v4 = a3;
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenPaymentBodys]((uint64_t)self);
  -[GEOPBTransitPaymentMethodSuggestionDetails _addNoFlagsEducationalScreenPaymentBody:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsEducationalScreenPaymentBody:(uint64_t)a1
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

- (unint64_t)educationalScreenPaymentBodysCount
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenPaymentBodys]((uint64_t)self);
  educationalScreenPaymentBodys = self->_educationalScreenPaymentBodys;

  return [(NSMutableArray *)educationalScreenPaymentBodys count];
}

- (id)educationalScreenPaymentBodyAtIndex:(unint64_t)a3
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenPaymentBodys]((uint64_t)self);
  educationalScreenPaymentBodys = self->_educationalScreenPaymentBodys;

  return (id)[(NSMutableArray *)educationalScreenPaymentBodys objectAtIndex:a3];
}

+ (Class)educationalScreenPaymentBodyType
{
  return (Class)objc_opt_class();
}

- (void)_readSuggestionTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodSuggestionDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionTitle_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasSuggestionTitle
{
  return self->_suggestionTitle != 0;
}

- (GEOFormattedString)suggestionTitle
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readSuggestionTitle]((uint64_t)self);
  suggestionTitle = self->_suggestionTitle;

  return suggestionTitle;
}

- (void)setSuggestionTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_suggestionTitle, a3);
}

- (void)_readSuggestionBody
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodSuggestionDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionBody_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasSuggestionBody
{
  return self->_suggestionBody != 0;
}

- (GEOFormattedString)suggestionBody
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readSuggestionBody]((uint64_t)self);
  suggestionBody = self->_suggestionBody;

  return suggestionBody;
}

- (void)setSuggestionBody:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_suggestionBody, a3);
}

- (void)_readEducationalScreenAssets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodSuggestionDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEducationalScreenAssets_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)educationalScreenAssets
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenAssets]((uint64_t)self);
  educationalScreenAssets = self->_educationalScreenAssets;

  return educationalScreenAssets;
}

- (void)setEducationalScreenAssets:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  educationalScreenAssets = self->_educationalScreenAssets;
  self->_educationalScreenAssets = v4;
}

- (void)clearEducationalScreenAssets
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  educationalScreenAssets = self->_educationalScreenAssets;

  [(NSMutableArray *)educationalScreenAssets removeAllObjects];
}

- (void)addEducationalScreenAsset:(id)a3
{
  id v4 = a3;
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenAssets]((uint64_t)self);
  -[GEOPBTransitPaymentMethodSuggestionDetails _addNoFlagsEducationalScreenAsset:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsEducationalScreenAsset:(uint64_t)a1
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

- (unint64_t)educationalScreenAssetsCount
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenAssets]((uint64_t)self);
  educationalScreenAssets = self->_educationalScreenAssets;

  return [(NSMutableArray *)educationalScreenAssets count];
}

- (id)educationalScreenAssetAtIndex:(unint64_t)a3
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenAssets]((uint64_t)self);
  educationalScreenAssets = self->_educationalScreenAssets;

  return (id)[(NSMutableArray *)educationalScreenAssets objectAtIndex:a3];
}

+ (Class)educationalScreenAssetType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitPaymentMethodSuggestionDetails;
  id v4 = [(GEOPBTransitPaymentMethodSuggestionDetails *)&v8 description];
  id v5 = [(GEOPBTransitPaymentMethodSuggestionDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitPaymentMethodSuggestionDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 84))
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
      if (a2) {
        objc_super v6 = @"paymentMethodRegionMuid";
      }
      else {
        objc_super v6 = @"payment_method_region_muid";
      }
      [v4 setObject:v5 forKey:v6];
    }
    id v7 = [(id)a1 educationalScreenHeader];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"educationalScreenHeader";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"educational_screen_header";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v12 = *(id *)(a1 + 40);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v51 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            if (a2) {
              [v17 jsonRepresentation];
            }
            else {
            v18 = [v17 dictionaryRepresentation];
            }
            [v11 addObject:v18];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v14);
      }

      if (a2) {
        v19 = @"educationalScreenPaymentBody";
      }
      else {
        v19 = @"educational_screen_payment_body";
      }
      [v4 setObject:v11 forKey:v19];
    }
    v20 = [(id)a1 suggestionTitle];
    v21 = v20;
    if (v20)
    {
      if (a2)
      {
        v22 = [v20 jsonRepresentation];
        v23 = @"suggestionTitle";
      }
      else
      {
        v22 = [v20 dictionaryRepresentation];
        v23 = @"suggestion_title";
      }
      [v4 setObject:v22 forKey:v23];
    }
    v24 = [(id)a1 suggestionBody];
    v25 = v24;
    if (v24)
    {
      if (a2)
      {
        v26 = [v24 jsonRepresentation];
        v27 = @"suggestionBody";
      }
      else
      {
        v26 = [v24 dictionaryRepresentation];
        v27 = @"suggestion_body";
      }
      [v4 setObject:v26 forKey:v27];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v29 = *(id *)(a1 + 24);
      uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v47;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v47 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v46 + 1) + 8 * j);
            if (a2) {
              [v34 jsonRepresentation];
            }
            else {
            v35 = [v34 dictionaryRepresentation];
            }
            [v28 addObject:v35];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v54 count:16];
        }
        while (v31);
      }

      if (a2) {
        v36 = @"educationalScreenAsset";
      }
      else {
        v36 = @"educational_screen_asset";
      }
      [v4 setObject:v28 forKey:v36];
    }
    v37 = *(void **)(a1 + 16);
    if (v37)
    {
      v38 = [v37 dictionaryRepresentation];
      v39 = v38;
      if (a2)
      {
        v40 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __72__GEOPBTransitPaymentMethodSuggestionDetails__dictionaryRepresentation___block_invoke;
        v44[3] = &unk_1E53D8860;
        id v41 = v40;
        id v45 = v41;
        [v39 enumerateKeysAndObjectsUsingBlock:v44];
        id v42 = v41;

        v39 = v42;
      }
      [v4 setObject:v39 forKey:@"Unknown Fields"];
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
  return -[GEOPBTransitPaymentMethodSuggestionDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __72__GEOPBTransitPaymentMethodSuggestionDetails__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitPaymentMethodSuggestionDetails)initWithDictionary:(id)a3
{
  return (GEOPBTransitPaymentMethodSuggestionDetails *)-[GEOPBTransitPaymentMethodSuggestionDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"paymentMethodRegionMuid";
      }
      else {
        objc_super v6 = @"payment_method_region_muid";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setPaymentMethodRegionMuid:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        objc_super v8 = @"educationalScreenHeader";
      }
      else {
        objc_super v8 = @"educational_screen_header";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v11 = [(GEOFormattedString *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOFormattedString *)v10 initWithDictionary:v9];
        }
        id v12 = (void *)v11;
        [a1 setEducationalScreenHeader:v11];
      }
      if (a3) {
        uint64_t v13 = @"educationalScreenPaymentBody";
      }
      else {
        uint64_t v13 = @"educational_screen_payment_body";
      }
      uint64_t v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      id v46 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v52 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v51 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v21 = [GEOFormattedString alloc];
                if (a3) {
                  uint64_t v22 = [(GEOFormattedString *)v21 initWithJSON:v20];
                }
                else {
                  uint64_t v22 = [(GEOFormattedString *)v21 initWithDictionary:v20];
                }
                v23 = (void *)v22;
                [a1 addEducationalScreenPaymentBody:v22];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v51 objects:v56 count:16];
          }
          while (v17);
        }

        id v5 = v46;
      }

      if (a3) {
        v24 = @"suggestionTitle";
      }
      else {
        v24 = @"suggestion_title";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v27 = [(GEOFormattedString *)v26 initWithJSON:v25];
        }
        else {
          uint64_t v27 = [(GEOFormattedString *)v26 initWithDictionary:v25];
        }
        v28 = (void *)v27;
        [a1 setSuggestionTitle:v27];
      }
      if (a3) {
        id v29 = @"suggestionBody";
      }
      else {
        id v29 = @"suggestion_body";
      }
      uint64_t v30 = [v5 objectForKeyedSubscript:v29];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v31 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v32 = [(GEOFormattedString *)v31 initWithJSON:v30];
        }
        else {
          uint64_t v32 = [(GEOFormattedString *)v31 initWithDictionary:v30];
        }
        v33 = (void *)v32;
        [a1 setSuggestionBody:v32];
      }
      if (a3) {
        v34 = @"educationalScreenAsset";
      }
      else {
        v34 = @"educational_screen_asset";
      }
      v35 = [v5 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v36 = v35;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v48;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v48 != v39) {
                objc_enumerationMutation(v36);
              }
              uint64_t v41 = *(void *)(*((void *)&v47 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v42 = [GEOAsset alloc];
                if (a3) {
                  uint64_t v43 = [(GEOAsset *)v42 initWithJSON:v41];
                }
                else {
                  uint64_t v43 = [(GEOAsset *)v42 initWithDictionary:v41];
                }
                v44 = (void *)v43;
                [a1 addEducationalScreenAsset:v43];
              }
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v47 objects:v55 count:16];
          }
          while (v38);
        }

        id v5 = v46;
      }
    }
  }

  return a1;
}

- (GEOPBTransitPaymentMethodSuggestionDetails)initWithJSON:(id)a3
{
  return (GEOPBTransitPaymentMethodSuggestionDetails *)-[GEOPBTransitPaymentMethodSuggestionDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_826;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_827;
    }
    GEOPBTransitPaymentMethodSuggestionDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPBTransitPaymentMethodSuggestionDetailsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitPaymentMethodSuggestionDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitPaymentMethodSuggestionDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPBTransitPaymentMethodSuggestionDetailsIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v14 = self->_reader;
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
    [(GEOPBTransitPaymentMethodSuggestionDetails *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_educationalScreenHeader) {
      PBDataWriterWriteSubmessage();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_educationalScreenPaymentBodys;
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
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    if (self->_suggestionTitle) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_suggestionBody) {
      PBDataWriterWriteSubmessage();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_educationalScreenAssets;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOPBTransitPaymentMethodSuggestionDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 18) = self->_readerMarkPos;
  *((_DWORD *)v12 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    v12[6] = self->_paymentMethodRegionMuid;
    *((unsigned char *)v12 + 84) |= 1u;
  }
  if (self->_educationalScreenHeader) {
    objc_msgSend(v12, "setEducationalScreenHeader:");
  }
  if ([(GEOPBTransitPaymentMethodSuggestionDetails *)self educationalScreenPaymentBodysCount])
  {
    [v12 clearEducationalScreenPaymentBodys];
    unint64_t v4 = [(GEOPBTransitPaymentMethodSuggestionDetails *)self educationalScreenPaymentBodysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPBTransitPaymentMethodSuggestionDetails *)self educationalScreenPaymentBodyAtIndex:i];
        [v12 addEducationalScreenPaymentBody:v7];
      }
    }
  }
  if (self->_suggestionTitle) {
    objc_msgSend(v12, "setSuggestionTitle:");
  }
  if (self->_suggestionBody) {
    objc_msgSend(v12, "setSuggestionBody:");
  }
  if ([(GEOPBTransitPaymentMethodSuggestionDetails *)self educationalScreenAssetsCount])
  {
    [v12 clearEducationalScreenAssets];
    unint64_t v8 = [(GEOPBTransitPaymentMethodSuggestionDetails *)self educationalScreenAssetsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOPBTransitPaymentMethodSuggestionDetails *)self educationalScreenAssetAtIndex:j];
        [v12 addEducationalScreenAsset:v11];
      }
    }
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
      GEOPBTransitPaymentMethodSuggestionDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBTransitPaymentMethodSuggestionDetails *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 48) = self->_paymentMethodRegionMuid;
    *(unsigned char *)(v5 + 84) |= 1u;
  }
  id v9 = [(GEOFormattedString *)self->_educationalScreenHeader copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v11 = self->_educationalScreenPaymentBodys;
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
        [(id)v5 addEducationalScreenPaymentBody:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v12);
  }

  id v16 = [(GEOFormattedString *)self->_suggestionTitle copyWithZone:a3];
  long long v17 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v16;

  id v18 = [(GEOFormattedString *)self->_suggestionBody copyWithZone:a3];
  long long v19 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v18;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v20 = self->_educationalScreenAssets;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (void)v27);
        [(id)v5 addEducationalScreenAsset:v24];
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v21);
  }

  v25 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v25;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  [(GEOPBTransitPaymentMethodSuggestionDetails *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_paymentMethodRegionMuid != *((void *)v4 + 6)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  educationalScreenHeader = self->_educationalScreenHeader;
  if ((unint64_t)educationalScreenHeader | *((void *)v4 + 4)
    && !-[GEOFormattedString isEqual:](educationalScreenHeader, "isEqual:"))
  {
    goto LABEL_17;
  }
  educationalScreenPaymentBodys = self->_educationalScreenPaymentBodys;
  if ((unint64_t)educationalScreenPaymentBodys | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](educationalScreenPaymentBodys, "isEqual:")) {
      goto LABEL_17;
    }
  }
  suggestionTitle = self->_suggestionTitle;
  if ((unint64_t)suggestionTitle | *((void *)v4 + 8))
  {
    if (!-[GEOFormattedString isEqual:](suggestionTitle, "isEqual:")) {
      goto LABEL_17;
    }
  }
  suggestionBody = self->_suggestionBody;
  if ((unint64_t)suggestionBody | *((void *)v4 + 7))
  {
    if (!-[GEOFormattedString isEqual:](suggestionBody, "isEqual:")) {
      goto LABEL_17;
    }
  }
  educationalScreenAssets = self->_educationalScreenAssets;
  if ((unint64_t)educationalScreenAssets | *((void *)v4 + 3)) {
    char v10 = -[NSMutableArray isEqual:](educationalScreenAssets, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  [(GEOPBTransitPaymentMethodSuggestionDetails *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_paymentMethodRegionMuid;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOFormattedString *)self->_educationalScreenHeader hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_educationalScreenPaymentBodys hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOFormattedString *)self->_suggestionTitle hash];
  unint64_t v7 = [(GEOFormattedString *)self->_suggestionBody hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_educationalScreenAssets hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 84))
  {
    self->_paymentMethodRegionMuid = *((void *)v4 + 6);
    *(unsigned char *)&self->_flags |= 1u;
  }
  educationalScreenHeader = self->_educationalScreenHeader;
  uint64_t v6 = *((void *)v4 + 4);
  if (educationalScreenHeader)
  {
    if (v6) {
      -[GEOFormattedString mergeFrom:](educationalScreenHeader, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOPBTransitPaymentMethodSuggestionDetails setEducationalScreenHeader:](self, "setEducationalScreenHeader:");
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = *((id *)v4 + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        [(GEOPBTransitPaymentMethodSuggestionDetails *)self addEducationalScreenPaymentBody:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  suggestionTitle = self->_suggestionTitle;
  uint64_t v13 = *((void *)v4 + 8);
  if (suggestionTitle)
  {
    if (v13) {
      -[GEOFormattedString mergeFrom:](suggestionTitle, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEOPBTransitPaymentMethodSuggestionDetails setSuggestionTitle:](self, "setSuggestionTitle:");
  }
  suggestionBody = self->_suggestionBody;
  uint64_t v15 = *((void *)v4 + 7);
  if (suggestionBody)
  {
    if (v15) {
      -[GEOFormattedString mergeFrom:](suggestionBody, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEOPBTransitPaymentMethodSuggestionDetails setSuggestionBody:](self, "setSuggestionBody:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = *((id *)v4 + 3);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[GEOPBTransitPaymentMethodSuggestionDetails addEducationalScreenAsset:](self, "addEducationalScreenAsset:", *(void *)(*((void *)&v21 + 1) + 8 * j), (void)v21);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v18);
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
      GEOPBTransitPaymentMethodSuggestionDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_831);
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x82u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPBTransitPaymentMethodSuggestionDetails *)self readAll:0];
    [(GEOFormattedString *)self->_educationalScreenHeader clearUnknownFields:1];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = self->_educationalScreenPaymentBodys;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    [(GEOFormattedString *)self->_suggestionTitle clearUnknownFields:1];
    [(GEOFormattedString *)self->_suggestionBody clearUnknownFields:1];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = self->_educationalScreenAssets;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionTitle, 0);
  objc_storeStrong((id *)&self->_suggestionBody, 0);
  objc_storeStrong((id *)&self->_educationalScreenPaymentBodys, 0);
  objc_storeStrong((id *)&self->_educationalScreenHeader, 0);
  objc_storeStrong((id *)&self->_educationalScreenAssets, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end